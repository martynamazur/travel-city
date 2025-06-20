import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketapp/presentation/screen/dashboard_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ticketapp/presentation/screen/splash_screen.dart';
import 'package:ticketapp/theme/app_theme.dart';

import 'l10n/app_localizations.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final supabaseKey = dotenv.env['SUPABASE_KEY'];
  final supabaseUrl = dotenv.env['SUPABASE_URL'];
  await Supabase.initialize(url: supabaseUrl!, anonKey: supabaseKey!);

  final clientId = dotenv.env['CLIENTID'];
  final clientSecret = dotenv.env['SECRET'];
  final transactionApiKey = dotenv.env['API_KEY_TRANSACTION'];
  final transactionApiPassword= dotenv.env['API_KEY_TRANSACTION_PASSWORD'];

  runApp(ProviderScope(
      child: const MyApp()
  ));
}

final supabase = Supabase.instance.client;


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:  lightTheme,
      //darkTheme: darkTheme,
      home: const SplashScreen(),
      routes: {
        '/dashboard': (context) => DashboardScreen(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: [
        Locale('en'),
        Locale('pl')
      ],
    );
  }
}
