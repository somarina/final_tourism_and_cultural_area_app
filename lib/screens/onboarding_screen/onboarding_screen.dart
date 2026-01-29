import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> images = [
    'assets/images/onboarding_screen/Onboarding01.png',
    'assets/images/onboarding_screen/Onboarding02.png',
    'assets/images/onboarding_screen/Onboarding03.png',
  ];

  final List<String> titles = [
    'Welcome',
    'Discover',
    'Get Started',
  ];

  final List<String> subtitles = [
    'Your journey begins here',
    'Find amazing experiences',
    'Let’s go!',
  ];

  final List<String> icons = [
    'assets/images/onboarding_screen/Onboarding1.2.png',
    'assets/images/onboarding_screen/Onboarding2.2.png',
    'assets/images/onboarding_screen/Onboarding3.2.png',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// PAGE VIEW (FULL SCREEN IMAGES)
          PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),

          /// SMALL IMAGE ABOVE BUTTON
          Positioned(
            bottom: 120,
            left: 24,
            right: 24,
            child: Column(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Image.asset(
                    icons[_currentPage],
                    key: ValueKey(_currentPage),
                    width: 500,
                    height: 130,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 6),
              ],
            ),
          ),

          /// DOT INDICATOR
          Positioned(
            bottom: 110,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 11,
                  width: _currentPage == index ? 30 : 12,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.black : Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),

          /// NEXT / GET STARTED BUTTON
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 350,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.zero, // prevents size changes
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                  onPressed: () {
                    if (_currentPage == images.length - 1) {
                      Navigator.pushReplacementNamed(context, '/homescreen');
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    _currentPage == images.length - 1 ? 'Get Started' : 'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
