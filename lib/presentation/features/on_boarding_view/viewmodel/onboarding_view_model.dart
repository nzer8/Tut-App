import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:tut_app/domain/model/models.dart';
import 'package:tut_app/presentation/base/base_view_model.dart';
import 'package:tut_app/presentation/resources/string_manger.dart';

import '../../../resources/assets_manger.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutPuts {
  // stream controller output

  final StreamController _streamController =
      BehaviorSubject<SliderViewObject>();
  late final List<SliderObject> _list;
  int currentIndex = 0;

  //OnBoarding ViewModel Input
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    //view model start your job
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNextSlide() {
    int nextIndex = currentIndex + 1;
    return nextIndex > 3 ? 3 : nextIndex;
  }

  @override
  int goPreviousSlide() {
    int previousIndex = currentIndex - 1;
    return previousIndex < 0 ? 0 : previousIndex;
  }

  @override
  void onPageChanged(int index) {
    currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  //OnBoarding ViewModel Output
  @override
  Stream<SliderViewObject> get outPutSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  //-------------------------------------------------
  // onBoarding private functions
  void _postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(
        _list[currentIndex],
        _list.length,
        currentIndex,
      ),
    );
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(
          title: AppString.onBoardingTitle1,
          subTitle: AppString.onBoardingSubTitle1,
          image: ImageAssets.onBoarding1,
        ),
        SliderObject(
          title: AppString.onBoardingTitle2,
          subTitle: AppString.onBoardingSubTitle2,
          image: ImageAssets.onBoarding2,
        ),
        SliderObject(
          title: AppString.onBoardingTitle3,
          subTitle: AppString.onBoardingSubTitle3,
          image: ImageAssets.onBoarding3,
        ),
        SliderObject(
          title: AppString.onBoardingTitle4,
          subTitle: AppString.onBoardingSubTitle4,
          image: ImageAssets.onBoarding4,
        ),
      ];
}

// inputs mean that 'الاوامر' that our view model will receive from view
//view يعني الاومر يلي لح يتلقاها من
mixin OnBoardingViewModelInputs {
  int goNextSlide(); // when user clicks right arrow or swap to left
  int goPreviousSlide(); // when user clicks left arrow or swap to right
  void onPageChanged(int index); // when move to new page

// stream controller input
  Sink get inputSliderViewObject;
}

mixin OnBoardingViewModelOutPuts {
  // stream controller Output
  Stream<SliderViewObject> get outPutSliderViewObject;
}
