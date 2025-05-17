import 'package:flutter/material.dart';

import 'package:ticketapp/presentation/screen/home_screen.dart';
import 'package:ticketapp/presentation/screen/login_screen.dart';
import '../../main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;


    await Future.delayed(Duration.zero);
    if (!mounted) {
      return;
    }

    if(isFirstLaunch){
      await prefs.setBool('isFirstLaunch', false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OnboardingScreen()),
      );
      return;
    }

    final session = supabase.auth.currentSession;

    if (session != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => HomeScreen()));

    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => LoginScreen()));

    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}