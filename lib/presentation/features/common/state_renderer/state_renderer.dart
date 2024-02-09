import 'package:flutter/material.dart';
import 'package:tut_app/data/network/failure.dart';

import '../../../resources/string_manger.dart';

enum StateRendererType {
  //POPUP  STATES (DIALOG)
  // اذا بدي تضل يلي بالخلف ظاهر بستخدم هذا النوع
  popupLoadingState,
  popupErrorState,

  //FULL SCREEN STATES (FULL SCREEN)
  // اذا يلي بالخلف ابدا مالو ظاهر بستخدم هذا النوع
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,

  // General (content of screen)
  contentState,
}

class StateRenderer extends StatelessWidget {
  StateRendererType stateRendererType;
  String message;
  String title;
  Function reTryActionFunction;

  StateRenderer({
    super.key,
    required this.stateRendererType,
    this.message = AppString.loading,
    this.title = '',
    required this.reTryActionFunction,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
