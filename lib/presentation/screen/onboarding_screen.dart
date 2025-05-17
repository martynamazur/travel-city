import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ticketapp/presentation/screen/home_screen.dart';
import 'package:ticketapp/presentation/screen/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  final _pageCount = 3;
  int _currentPage = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
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
              child: Text('Skip'),
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
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
          ),

          // Next or Start button
          if (!isLastPage)
            IconButton(
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
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
              child: const Text('Start'),
            ),
        ],
      ),
    );
  }


  Widget _buildIntroduction() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 180,
          width: 180,
          child: Image.asset('assets/bus.png'),
        ),
        Text('Witaj w TravelCity!'),
        Text('Twoje bilety komunikacji miejskiej — zawsze w zasięgu ręki.Kupuj, zarządzaj i podróżuj wygodnie — bez kolejek i drobnych.'),

      ],
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
        Text('Bezpieczne i szybkie płatności'),
        Text('Obsługujemy BLIK, karty, Google Pay i Apple Pay.'),

      ],
    );

  }

  Widget _buildPurchasePageInf() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 180,
          width: 180,
          //Ilustracja: Telefon z otwartą aplikacją i widocznymi rodzajami biletów
          child: Image.asset('assets/bus.png'),
        ),
        Text('Kup bilety jednym kliknięciem'),
        Text('Wybierz bilet, zapłać i gotowe. Bilet znajdziesz od razu w aplikacji.'),

      ],
    );

  }
}
