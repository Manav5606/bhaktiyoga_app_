import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../routes/app_routes.dart';

class SplashScreen {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      Timer(const Duration(seconds: 3),
          () => Navigator.pushReplacementNamed(context, AppRoutes.homeScreen));
    } else {
      Timer(const Duration(seconds: 3),
          () => Navigator.pushReplacementNamed(context, AppRoutes.googlesignin));
    }
  }
}
