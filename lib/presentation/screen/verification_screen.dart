import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketapp/data/provider/user_repository_provider.dart';
import 'package:ticketapp/presentation/screen/home_screen.dart';

import '../../model/otp_result.dart';

class VerificationScreen extends ConsumerStatefulWidget {
  final String phoneNumber;
  const VerificationScreen(this.phoneNumber, {super.key});

  @override
  ConsumerState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends ConsumerState<VerificationScreen> {
  final _keyForm = GlobalKey<FormState>();
  final _codeInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _keyForm,
              child: Column(
                children: [
                  Text('Wyslano na nr'),
                  Text(widget.phoneNumber.toString()),
                  TextFormField(
                    controller: _codeInputController,
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value == null || value.trim().isEmpty){
                        return 'Wpisz kod';
                      }
                    },
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      final token = _codeInputController.text.trim();

                      if (_keyForm.currentState!.validate()) {
                        final result = await ref.read(verifyOtpProvider(
                          phoneNumber: widget.phoneNumber,
                          token: token,
                        ).future);

                        if (result.success) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => HomeScreen()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(result.errorMessage ?? 'Wystąpił błąd')),
                          );
                        }
                      } else {
                        _codeInputController.clear();
                      }
                    },
                    child: Text('Zaloguj się'),
                  )

                ],

              ),
            ),
          )
      ),
    );
  }
}
