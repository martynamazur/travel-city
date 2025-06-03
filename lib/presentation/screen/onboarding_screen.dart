import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ticketapp/l10n/app_localizations.dart';
import 'package:ticketapp/presentation/screen/home_screen.dart';
import 'package:ticketapp/presentation/screen/login_screen.dart';

import '../../theme/app_text_style.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final _pageController = PageController();
  final _pageCount = 3;
  int _currentPage = 0;

  static const _kAnimationDuration = Duration(milliseconds: 500);
  static const _kAnimationCurve = Curves.ease;

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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (value){
                      setState(() {
                        _currentPage = value;
                      });
                    },
                    children: [
                      _buildIntroduction(),
                      _buildPurchasePageInf(),
                      _buildPaymentMethodInf(),
                    ],
                  ),
                ),
                _buildPageViewNavigation()
              ],
            ),
          )
      ),
    );
  }

  Widget _buildPageViewNavigation() {
    final isLastPage = _currentPage == _pageCount - 1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!isLastPage)
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                );
              },
              child: Text(_loc.skip),
            )
          else
            const SizedBox(width: 60),


          SmoothPageIndicator(
            controller: _pageController,
            count: _pageCount,
            effect: ExpandingDotsEffect(),
            onDotClicked: (index) {
              _pageController.animateToPage(
                index,
                duration: _kAnimationDuration,
                curve: _kAnimationCurve,
              );
            },
          ),


          if (!isLastPage)
            IconButton(
              onPressed: () {
                _pageController.nextPage(
                  duration: _kAnimationDuration,
                  curve: _kAnimationCurve,
                );
              },
              icon: const Icon(Icons.arrow_forward),
            )
          else
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                );
              },
              child: Text(_loc.start),
            ),
        ],
      ),
    );
  }


  Widget _buildIntroduction() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 380,
            width: 380,
            child: Image.asset('assets/onboarding/illustration_screen2.png'),
          ),
          Text(_loc.onboardingWelcomeTitle, style: AppTextStyles.headline),
          Text(_loc.onboardingWelcomeDescription, textAlign: TextAlign.left, style: TextStyle(fontSize: 16.0))
        ],
      ),
    );
    
  }
  Widget _buildPaymentMethodInf() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 180,
          width: 180,
          child: Image.asset('assets/bus.png'),//Ilustracja: Karta, BLIK, portfel, telefon
        ),
        Text(_loc.onboardingPaymentsTitle,style: AppTextStyles.headline),
        Text(_loc.onboardingPaymentsDescription,textAlign: TextAlign.left, style: TextStyle(fontSize: 16.0)),

      ],
    );

  }

  Widget _buildPurchasePageInf() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 180,
            width: 180,
            //Ilustracja: Telefon z otwartą aplikacją i widocznymi rodzajami biletów
            child: Image.asset('assets/bus.png'),
          ),
          Text(_loc.onboardingPurchaseTitle, style: AppTextStyles.headline),
          Text(_loc.onboardingPurchaseDescription, textAlign: TextAlign.left, style: TextStyle(fontSize: 16.0)),

        ],
      ),
    );

  }
}
