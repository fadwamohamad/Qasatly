import 'package:flutter/material.dart';
import 'package:qastly/modules/login/loginPage.dart';
import 'package:qastly/shared/component/component.dart';

import '../network/local/cache_helper.dart';

void logOut(context) {
  CacheHelper().removeData(key: 'token').then((value) {
    if (value)
      navigateAndFinish(context, Login());
  });
}

String? token = '';

String printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
  return text;
}