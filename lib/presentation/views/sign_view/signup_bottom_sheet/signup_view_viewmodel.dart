// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

part 'viewmodel_mixins/logic_helper.dart';

final class SignUpViewModel extends BaseViewModel with _LogicHelper {
  SignUpViewModel({ScrollController? scrollController}) {
    this.scrollController = scrollController;

    initFocusNodes();
  }
}
