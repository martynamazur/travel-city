import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketapp/data/repository/user_repository.dart';
import 'package:ticketapp/model/otp_result.dart';


part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository(Ref ref) {
  return  UserRepository();
}

@riverpod
Future<bool> sendOtp(Ref ref, {required String phoneNumber}) async {
  return ref.read(userRepositoryProvider).sendOtp(phoneNumber);
}

@riverpod
Future<OtpResult> verifyOtp(Ref ref,{required String phoneNumber,required String token}) async {
  return ref.read(userRepositoryProvider).verifyOtp(phoneNumber, token);
}
