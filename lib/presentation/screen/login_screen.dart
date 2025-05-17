import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketapp/data/provider/user_repository_provider.dart';
import 'package:ticketapp/presentation/screen/verification_screen.dart';

/*
    FLOW
    no password is required
    Input - Phone number ->
    Send - Code via SMS -> Give permission to read mess -> autocomplete / user write code
    if ok login in


 */
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _inputPhoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text('Log in with phone number'),
                TextFormField(
                  controller: _inputPhoneNumberController,
                  keyboardType: TextInputType.phone,
                  validator: (value)
                  {
                    if(value == null || value.trim().isEmpty){
                      return 'To pole nie może być puste';
                    }
                    return null;
                  },
                ),
                OutlinedButton(
                    onPressed: () async {
                      final phoneNumber = _inputPhoneNumberController.text.trim();

                      if (_formKey.currentState!.validate()) {
                        final response = await ref.read(sendOtpProvider(phoneNumber: phoneNumber).future);

                        if (response) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (builder) => VerificationScreen(phoneNumber)),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            /*
                                AuthException – np. niepoprawny numer telefonu, format, numer nieobsługiwany, itp.
                                Dowolny inny błąd – np. brak internetu, Supabase nie odpowiada, błąd sieciowy.

                                ✅ Przykłady sytuacji, które zwrócą false:
                                  Numer telefonu ma nieprawidłowy format (+48123123123 zamiast np. +48 123 123 123 – zależnie od walidatora Supabase).
                                  Brak połączenia z internetem.
                                  Supabase ma chwilowy problem (serwer nie działa).
                                  Przekroczony limit prób OTP.
                                  Numer nieobsługiwany przez usługę OTP.
                             */
                            SnackBar(content: Text('Ups, coś poszło nie tak. Spróbuj ponownie')),
                          );
                        }
                      } else {
                        _inputPhoneNumberController.clear();
                      }
                    },
                    child: Text('Log in')
                )
              ],
            ),
          )
      ),
    );
  }
}
