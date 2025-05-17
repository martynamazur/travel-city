
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


  Future<bool> sendOtp(String phoneNumber) async{
    try{
      await supabase.auth.signInWithOtp(phone: phoneNumber.toString());
      return true;

    }on AuthException catch(e){
      developer.log('AuthException (OTP): ${e.message}');
      return false;
    }catch(e){
      developer.log('Błąd wysyłania OTP: $e');
      return false;

    }
  }

  Future<OtpResult> verifyOtp(String phoneNumber, String token) async {
    try {
      final response = await supabase.auth.verifyOTP(
        phone: phoneNumber,
        token: token,
        type: OtpType.sms,
      );

      if (response.session != null && response.user != null) {
        return OtpResult.success();
      } else {
        return OtpResult.failure('Nie udało się zalogować. Spróbuj ponownie.');
      }
    } on AuthException catch (e) {
      developer.log('Błąd weryfikacji OTP: ${e.message}');
      return OtpResult.failure(e.message);
    } catch (e) {
      developer.log('Inny błąd: $e');
      return OtpResult.failure('Wystąpił nieoczekiwany błąd.');
    }
  }





}