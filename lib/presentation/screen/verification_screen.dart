import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:ticketapp/data/provider/user_repository_provider.dart';
import 'package:ticketapp/helper/localization_get_key.dart';
import 'package:ticketapp/presentation/screen/home_screen.dart';
import 'package:ticketapp/presentation/widget/primary_button.dart';
import 'package:ticketapp/presentation/widget/text_button_counter.dart';

import '../../l10n/app_localizations.dart';
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
  final StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();

  bool hasError = false;
  String currentText = "";

  bool isSendAgainBtnDisabled = false;
  late final AppLocalizations _loc;

  @override
  void initState() {
    super.initState();
    _startListeningForCode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loc = AppLocalizations.of(context)!;
  }


  @override
  void dispose() {
  _stopListeningForCode();
  errorController.close();
  _codeInputController.dispose();

  super.dispose();
  }

  void _startListeningForCode() async{
    await SmsAutoFill().listenForCode();

    SmsAutoFill().code.listen((code){
      if(code.isNotEmpty){
        setState(() {
          _codeInputController.text = code;
        });
   }
    });
  }

  void _stopListeningForCode() async{
    await SmsAutoFill().unregisterListener();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _keyForm,
                child: Column(
                  children: [
                    Text(_loc.phoneVerificationTitle, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500)),
                    Text(_loc.enterCodeSentToNumber(widget.phoneNumber)),
                    SizedBox(height: 32.0),

                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PinCodeTextField(
                          length: 6,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                            activeColor: Colors.green,
                            inactiveFillColor: Colors.grey[100],
                            selectedFillColor: Colors.white,
                            errorBorderColor: Colors.green,

                          ),
                          animationDuration: Duration(milliseconds: 300),
                          //backgroundColor: Colors.blue.shade50,
                          enableActiveFill: true,
                          errorAnimationController: errorController,
                          controller: _codeInputController,
                          onCompleted: (v) {
                            if (kDebugMode) {
                              print("Completed");
                            }
                          },
                          onChanged: (value) {
                            if (kDebugMode) {
                              print(value);
                            }
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            if (kDebugMode) {
                              print("Allowing to paste $text");
                            }
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          }, appContext: context,
                        ),

                      ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_loc.didntReceiveCode),
                        TextButtonCounter(onResend: () async {
                          final messenger = ScaffoldMessenger.of(context);
                          final Result result = await ref.read(sendOtpProvider(phoneNumber: widget.phoneNumber).future);
                          if(result.success){
                            return true;
                          }else{
                            final message = _loc.get(result.errorMessage!);
                            messenger.showSnackBar(SnackBar(content: Text(message)));
                            return false;
                          }
                        })
                      ],
                    ),
                    PrimaryButton(
                      text: _loc.verify,
                      onPressed: _verifyOtp,
                    )
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }

  Future<void> _verifyOtp() async{
    final token = _codeInputController.text.trim();
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);


    if (_keyForm.currentState!.validate()) {
      final result = await ref.read(verifyOtpProvider(
        phoneNumber: widget.phoneNumber,
        token: token,
      ).future);

      if (result.success) {
        navigator.push(MaterialPageRoute(builder: (_) => HomeScreen()),);
      } else {
        messenger.showSnackBar(SnackBar(content: Text(result.errorMessage ?? _loc.error)));
      }
    } else {
      _codeInputController.clear();
    }
  }
}
