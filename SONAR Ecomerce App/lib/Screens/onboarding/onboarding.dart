import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 50, 0, 35),
          child: PageView(
            controller: _controller,
            children: [
              OnboardingPage(
                headTitle: 'SONAR',
                image: 'assets/images/splash_1.png',
                title: 'Hello Guys',
                description: 'Welcome to ',
                slideIndex: true,
              ),
              OnboardingPage(
                headTitle: 'SONAR',
                image: 'assets/images/splash_2.png',
                title: 'Discover Features',
                description: 'Description for page 2',
                slideIndex: false,
              ),
              OnboardingPage(
                headTitle: 'SONAR',
                image: 'assets/images/splash_3.png',
                title: 'Get Started',
                description:
                    'We have the easy way to shop \nStay at home with us ',
                slideIndex: false,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: OnboardingBottomSheet(controller: _controller),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String headTitle;
  final bool slideIndex;

  OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
    required this.headTitle,
    required this.slideIndex,
  });

  @override
  Widget build(BuildContext context) {
    var sonar = 'SONAR';
    var desc_suite = '. Let\'s shop';
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //SizedBox(height: 150),
            Text(
              '${sonar}',
              style: TextStyle(
                color: const Color.fromRGBO(255, 167, 38, 1),
                fontFamily: 'bitterr',
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 70),
        Image.asset(image, height: 300),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: '${description}',
            style: TextStyle(color: Colors.grey, fontSize: 18),
            children: <TextSpan>[
              if (slideIndex)
                TextSpan(
                  text: '${sonar}',
                  style: TextStyle(
                    color: Color.fromARGB(247, 132, 130, 130),
                    fontFamily: 'bitterr',
                    fontSize: 17,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 59, 57, 57),
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
              if (slideIndex)
                TextSpan(
                  text: '${desc_suite}',
                ),
            ],
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 40.0),
        //   child: Text(
        //     description,
        //     textAlign: TextAlign.center,
        //     style: TextStyle(fontSize: 16),
        //   ),
        // ),
      ],
    );
  }
}

class OnboardingBottomSheet extends StatefulWidget {
  final PageController controller;

  const OnboardingBottomSheet({required this.controller});

  @override
  _OnboardingBottomSheetState createState() => _OnboardingBottomSheetState();
}

class _OnboardingBottomSheetState extends State<OnboardingBottomSheet> {
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      int next = widget.controller.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 255, 115, 0),
            ),
            onPressed: () {
              Navigator.pop(context);
              widget.controller.animateToPage(2,
                  duration: Duration(milliseconds: 400), curve: Curves.linear);
            },
            child: Text('SKIP'),
          ),
          Row(
            children: List.generate(3, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? Color.fromARGB(255, 255, 115, 0)
                      : Colors.grey,
                ),
              );
            }),
          ),
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 255, 115, 0),
            ),
            onPressed: () {
              if (_currentPage == 2) {
                // Navigate to the home screen or other destination
                Navigator.pushNamed(context, '/signin');
              } else {
                widget.controller.nextPage(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.linear);
              }
            },
            child: Text(_currentPage == 2 ? 'DONE' : 'NEXT'),
          ),
        ],
      ),
    );
  }
}
