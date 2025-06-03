import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketapp/data/provider/user_repository_provider.dart';
import 'package:ticketapp/l10n/app_localizations.dart';
import 'package:ticketapp/presentation/screen/verification_screen.dart';
import 'package:ticketapp/presentation/widget/primary_button.dart';
import 'package:ticketapp/theme/app_colors.dart';

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

  late final AppLocalizations _loc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loc = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 12.0,
                children: [
                    SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/login_picture.png',
                      fit: BoxFit.cover,
                    ),
                  ),
              
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Column(
                      spacing: 16.0,
                      children: [
                        Text(_loc.loginTitle,textAlign: TextAlign.center ,style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                        Text(_loc.loginSubtitle),
                        SizedBox(height: 4.0),
                        IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            spacing: 8.0,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFF2F3F5),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.primary,
                                        width: 1.0
                                    )
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('+48'))
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF2F3F5),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: AppColors.primary,
                                          width: 1.0
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        label: Text(_loc.enterPhoneNumber),
                                        labelStyle: TextStyle(color: Colors.grey[400]),
                                        suffixIcon: Icon(Icons.phone_android_outlined),
                                        suffixIconColor: Colors.grey[400],
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                      ),
                                      controller: _inputPhoneNumberController,
                                      keyboardType: TextInputType.phone,
                                      validator: (value)
                                      {
                                        if(value == null || value.trim().isEmpty){
                                          return _loc.fieldCannotBeEmpty;
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            onPressed: () async {
                              final phoneNumber = formatPhoneNumber(_inputPhoneNumberController.text);
                              final navigator = Navigator.of(context);
                              final messenger = ScaffoldMessenger.of(context);


                              if (_formKey.currentState!.validate()) {
                                final response = await ref.read(sendOtpProvider(phoneNumber: phoneNumber).future);

                                if (response.success) {
                                  navigator.push(MaterialPageRoute(builder: (_) => VerificationScreen(phoneNumber)));
                                } else {
                                  messenger.showSnackBar(SnackBar(content: Text(_loc.somethingWentWrong)));
                                }
                              } else {
                                _inputPhoneNumberController.clear();
                              }
                            },
                            text: _loc.continueHeadline,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }

  String formatPhoneNumber(String rawPhoneNumber) {
    String raw = rawPhoneNumber.trim().replaceAll(' ', '').replaceAll('-', '');
    final phoneNumber = raw.startsWith('+48') ? raw : '+48$raw';
    return phoneNumber;
  }
}
