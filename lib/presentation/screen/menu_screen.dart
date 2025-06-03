import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketapp/data/provider/user_repository_provider.dart';
import 'package:ticketapp/l10n/app_localizations.dart';
import 'package:ticketapp/main.dart';
import 'package:ticketapp/presentation/screen/login_screen.dart';
import 'package:ticketapp/presentation/screen/settings/setting_screen.dart';
import 'package:ticketapp/presentation/screen/settings/terms_and_conditions.dart';
import 'package:ticketapp/presentation/screen/wallet_screen.dart';
import 'package:ticketapp/presentation/widget/settings_tile.dart';

import 'settings/about_app_screen.dart';

class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key});

  @override
  ConsumerState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<MenuScreen> {

  late final AppLocalizations _loc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loc = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    final userPhoneNumber = supabase.auth.currentUser!.phone;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nr tel nigdy nie bedzie nullem bo za pomoca niego jest zakaldane konto
                  Text(_loc.menuPhoneNumberLabel(userPhoneNumber!), style: TextStyle(fontSize: 18.0)),
                  const SizedBox(height: 32.0),
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SettingsTile(
                          title: _loc.menuWallet,
                          icon: Icons.wallet,
                          onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (_) => WalletScreen()))
                      ),
                      SettingsTile(
                          title: _loc.menuSettings,
                          icon: Icons.settings,
                          onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (_) => SettingScreen()))
                      ),
                      SettingsTile(
                          title: _loc.menuAboutApp,
                          icon: Icons.phone_android_outlined,
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AboutAppScreen()))
                      ),
                      SettingsTile(
                          title: _loc.menuTermsAndConditions,
                          icon: Icons.book,
                          onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (_) => TermsAndConditionsScreen())
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 32.0),

                  SizedBox(
                      width: double.infinity,
                    child: OutlinedButton(onPressed: () async{
                      final navigator = Navigator.of(context);
                      final result = await ref.read(logOutProvider.future);

                      if(result.success){
                        navigator.push(MaterialPageRoute(builder: (_) => LoginScreen()));
                      }else{
                        _showFlushBarError(result.errorMessage!);
                    }}, child: Text(_loc.menuSignOut)),
                  )
                ],

              ),
            ),
          )
      ),
    );
  }
  void _showFlushBarError(String errorMessage){
    Flushbar(
      title: errorMessage,
      duration: Duration(seconds: 10),
    ).show(context);
  }
}
