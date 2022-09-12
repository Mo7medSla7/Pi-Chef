import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foods_app/modules/Layout/Layout_Screen.dart';
import 'package:foods_app/modules/login_screen/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
   const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: PageView(
          onPageChanged: (index){
            setState(() =>
              isLastPage = index == 3
            );
          },
          controller: pageController,
          physics: const BouncingScrollPhysics(),
          children: [
            buildPage(
                image: 'assets/images/on_boarding/on_boarding1.svg',
                title: 'All your favorites',
                subtitle: 'Hungry or craving for some delish and awesome delicacies?',
            ),
            buildPage(
              image: 'assets/images/on_boarding/on_boarding2.svg',
              title: 'Variety of foods',
              subtitle: 'With so many options to choose from and a few clicks, you would be good to go',
            ),
            buildPage(
              image: 'assets/images/on_boarding/on_boarding3.svg',
              title: 'Search for a place',
              subtitle: 'Set your location to start exploring restaurants around you',
            ),
            buildPage(
              image: 'assets/images/on_boarding/on_boarding4.svg',
              title: 'Fast delivery',
              subtitle: 'Super-fast delivery that defies the logics of physics',
            ),

          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            SmoothPageIndicator(
                controller: pageController,
                count: 4,
                effect:  const ExpandingDotsEffect(
                  spacing: 8,
                  dotColor: Colors.black26,
                  activeDotColor: Colors.deepOrange,
                ),
            ),
            const Spacer(),
            if(!isLastPage)
            TextButton(
                onPressed: (){pageController.animateToPage(3, duration: const Duration(milliseconds: 800), curve: Curves.linear);},
                child: const Text('Skip',style: TextStyle(fontSize: 18),))
            else
              TextButton(
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder:(context) => const LoginScreen()));},
                  child: const Text('Get Started',style: TextStyle(fontSize: 18),))
          ],
        ),
      ),
    );
  }

  Widget buildPage({ required String image,
    required String title,
    required String subtitle,
  })
  {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Container(
          alignment: AlignmentDirectional.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(image),
              Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    textAlign: TextAlign.center,
                    subtitle,
                    style: const TextStyle(

                        fontSize: 20,
                        color: Colors.grey
                    ),
                  ),
                ],
              ),
            ],
          ),

        ),
      ),
    );
}
}
