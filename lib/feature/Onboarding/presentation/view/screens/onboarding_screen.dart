// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:nti_shopping_app/core/routes/app_routes.dart';
import 'package:nti_shopping_app/core/widgets/custom_button.dart';
import 'package:nti_shopping_app/feature/Onboarding/presentation/view/widget/custom_animated_widget.dart';
import 'package:nti_shopping_app/core/theme/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  Future<void> _finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);
    if (mounted) {
      Navigator.of(context).pushNamed(AppRoutes.hello);
    }
  }

  List<OnboardingData> onboardingList = dataOnboading();
  int index = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        leading: index > 0
            ? IconButton(
                onPressed: () {
                  controller.previousPage(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeIn,
                  );
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.primaryColorBlack,
                  size: 32,
                ),
              )
            : null,
        actions: [
          if (index == 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextButton(
                onPressed: _finishOnboarding,
                child: Text(
                  "Skip",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColorBlack,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //!image onboarding
              SizedBox(
                height: 315,
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return CustomAnimatedWidget(
                      index: index,
                      delay: index,
                      child: Image.asset(onboardingList[index].image),
                    );
                  },
                  itemCount: onboardingList.length,
                ),
              ),
              const SizedBox(height: 15),
              //!indicator onboarding
              SmoothPageIndicator(
                controller: controller,
                count: onboardingList.length,
                effect: const ColorTransitionEffect(
                  activeDotColor: AppColors.primaryColorBlack,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 5,
                  dotColor: AppColors.defaultHintTextColor,
                ),
              ),
              const SizedBox(height: 55),
              CustomAnimatedWidget(
                index: index,
                delay: (index + 1) * 200,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 45),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        onboardingList[index].title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColorBlack,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        onboardingList[index].description,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColors.defaultHintTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 55),
              //!button next onboarding
              CustomButton(
                text: (index < onboardingList.length - 1)
                    ? "Next"
                    : "Get started",
                onTap: () {
                  if (index < onboardingList.length - 1) {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  } else {
                    _finishOnboarding();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;
  final String image;
  OnboardingData({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<OnboardingData> dataOnboading() {
  return [
    OnboardingData(
      title: 'Discover Trends',
      description: 'Now we are here to provide variety of the best fashion',
      image: 'assets/images/onboarding-1-screen.png',
    ),
    OnboardingData(
      title: 'Latest out fit',
      description: 'Express your self through the art of the fashionism',
      image: 'assets/images/onboarding-2-screen.png',
    ),
  ];
}
