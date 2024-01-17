import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tut_app/domain/model/models.dart';
import 'package:tut_app/presentation/resources/string_manger.dart';

import '../../../resources/app_router.dart';
import '../../../resources/color_manger.dart';
import '../view_model/onboarding_view_model.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => OnBoardingState();
}

class OnBoardingState extends State<OnBoarding> {
  PageController pageController = PageController();
  OnBoardingViewModel viewModel = OnBoardingViewModel();

  _bind() {
    viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: viewModel.outPutSliderViewObject,
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? data) {
    if (data == null) {
      return const Center(
        child: Text('No Data'),
      );
    } else {
      return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: FloatingActionButton(
            onPressed: () {
              GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              //side: const BorderSide(width: 0.1),
            ),
            backgroundColor: ColorManger.white,
            elevation: 0,
            child: Text(
              viewModel.currentIndex < 3 ? AppString.skip : '',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManger.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
            ),
          ),
        ),
        backgroundColor: ColorManger.white,
        appBar: AppBar(
          backgroundColor: ColorManger.white,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManger.white,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          controller: pageController,
          itemCount: data.numOfObject,
          onPageChanged: (index) {
            viewModel.onPageChanged(index);
            // Check if currentIndex is 3 and navigate to login screen
            if (viewModel.currentIndex == 3) {
              Future.delayed(const Duration(seconds: 3), () {
                GoRouter.of(context).push(
                  AppRouter.kLoginView,
                );
              });
            }
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(
              sliderObject: data.sliderObject,
            );
          },
        ),
        bottomSheet: Container(
          color: ColorManger.white,
          child: _getBottomSheetWidget(
            sliderViewObject: data,
            previousIcons: Icons.arrow_back_ios_new,
            nextIcons: Icons.arrow_forward_ios,
          ),
        ),
      );
    }
  }

  _getBottomSheetWidget({
    required SliderViewObject sliderViewObject,
    required IconData previousIcons,
    required IconData nextIcons,
  }) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      color: ColorManger.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (sliderViewObject.currentIndex > 0)
            // Conditionally render the left arrow
            Padding(
              padding: const EdgeInsets.only(bottom: 14.0),
              child: SizedBox(
                height: 20,
                child: IconButton(
                  onPressed: () {
                    // left arrow
                    pageController.animateToPage(
                      viewModel.goPreviousSlide(),
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.bounceInOut,
                    );
                  },
                  icon: Icon(previousIcons),
                  color: ColorManger.white,
                ),
              ),
            ),
          // circles
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < sliderViewObject.numOfObject; i++)
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: _getCircle(i, sliderViewObject.currentIndex),
                    ),
                ],
              ),
            ),
          ),
          //-------
          if (sliderViewObject.currentIndex < 3)
            Padding(
              padding: const EdgeInsets.only(bottom: 14.0),
              child: SizedBox(
                height: 20,
                child: IconButton(
                  onPressed: () {
                    // right  arrow
                    pageController.animateToPage(
                      viewModel.goNextSlide(),
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.bounceInOut,
                    );
                  },
                  icon: Icon(nextIcons),
                  color: ColorManger.white,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _getCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return Icon(
        Icons.brightness_1_outlined,
        color: ColorManger.white,
        size: 14,
      );
    } else {
      return Icon(
        Icons.brightness_1,
        color: ColorManger.white,
        size: 14,
      );
    }
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key, required this.sliderObject})
      : super(key: key);

  final SliderObject sliderObject;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 42,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 16,
                  color: ColorManger.darkGrey,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 37.0,
            vertical: 10,
          ),
          child: Text(
            sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: ColorManger.darkGrey,
                ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        SvgPicture.asset(sliderObject.image),
      ],
    );
  }
}
