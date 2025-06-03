
import 'dart:developer' as developer;
import 'dart:math';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ticketapp/main.dart';

import '../../model/otp_result.dart';

class UserRepository{

  /*
      Supabase
      Co się stanie?
      🔹  Nie istnieje w bazie	Supabase tworzy nowe konto
      🔹  Już istnieje	Supabase normalnie loguje użytkownika
   */


  Future<Result> sendOtp(String phoneNumber) async{
    try{
      await supabase.auth.signInWithOtp(phone: phoneNumber.toString());
      return Result.success();
    }on AuthException catch(e){
      developer.log('AuthException (OTP): ${e.message}');
      return Result.failure(e.message);
    }catch(e){
      developer.log('Błąd wysyłania OTP: $e');
      return  Result.failure('errorUnknown');
    }
  }

  Future<Result> verifyOtp(String phoneNumber, String token) async {
    try {
      final response = await supabase.auth.verifyOTP(
        phone: phoneNumber,
        token: token,
        type: OtpType.sms,
      );

      if (response.session != null && response.user != null) {
        return Result.success();
      } else {
        return Result.failure('Nie udało się zalogować. Spróbuj ponownie.');
      }
    } on AuthException catch (e) {
      developer.log('Błąd weryfikacji OTP: ${e.message}');
      return Result.failure(e.message);
    } catch (e) {
      developer.log('Inny błąd: $e');
      return Result.failure('Wystąpił nieoczekiwany błąd.');
    }
  }

  Future<Result> logOut() async{
    try{
      await supabase.auth.signOut();
      //await _storage.write(key: 'authToken', value: '');
      return Result.success();

    }on AuthException catch(e){
      developer.log('AuthException: ${e.message}');
      return Result.failure(e.message);
    } catch(e){
      developer.log('Błąd przy wylogowywaniu: $e');
      return Result.failure('Wystąpił nieoczekiwany błąd.Spróbuj ponownie.');
    }
  }

  Future<Result> deleteAccount() async{
    try{
      final response = await supabase.functions.invoke('delete_user_account', body: {'name': 'Functions'});
      if(response.status == 200){
        return Result.success();
      }else{
        final errorMessage = response.data['error'] ?? 'Nieznany błąd';
        return Result.failure(errorMessage);
      }

    }catch(e){
      return Result.failure('Wystąpił nieoczekiwany błąd.Spróbuj ponownie.');
    }
  }

}