import 'package:flutter/material.dart';

import 'package:bhaktiyoga_ios/ram/home/home.dart';
import 'package:bhaktiyoga_ios/ram/login/auth_service.dart';

import '../ram/bankdetails/bank_detail.dart';
import '../ram/bankdetails/confirm_detail.dart';
import '../ram/bankdetails/withdrawn_success.dart';
import '../ram/blessing_details/blessing_details.dart';
import '../ram/blessing_details/blessing_withdraw.dart';
import '../ram/goal/animate.dart';
import '../ram/goal/choose_goal.dart';
import '../ram/goal/custom_dialog.dart';
import '../ram/goal/exit_prayer.dart';
import '../ram/goal/goal_achieved.dart';
import '../ram/goal/write.dart';
import '../ram/login/forgot.dart';
import '../ram/login/login.dart';
import '../ram/profile/request_changes.dart';
import '../ram/profile/request_dilaog.dart';
import '../ram/profile/request_process_dialog.dart';
import '../ram/profile/user_profile.dart';
import '../ram/profile/verify_details.dart';
import '../ram/signup/signup.dart';
import '../ram/splash/home_splash.dart';
import '../ram/splash/splash.dart';

class AppRoutes {
  static const String iphone14ProNineScreen = '/iphone_14_pro_nine_screen';

  static const String iphone14ProEightScreen = '/iphone_14_pro_eight_screen';

  static const String iphone14ProElevenScreen = '/iphone_14_pro_eleven_screen';

  static const String iphone14ProThirtythreeScreen =
      '/iphone_14_pro_thirtythree_screen';

  static const String iphone14ProThirtyeightScreen =
      '/iphone_14_pro_thirtyeight_screen';

  static const String iphone14ProThirtyoneScreen =
      '/iphone_14_pro_thirtyone_screen';

  static const String iphone14ProFortytwoScreen =
      '/iphone_14_pro_fortytwo_screen';

  static const String iphone14ProTwentyfourScreen =
      '/iphone_14_pro_twentyfour_screen';

  static const String iphone14ProFortysixScreen =
      '/iphone_14_pro_fortysix_screen';

  static const String iphone14ProTwentyfiveScreen =
      '/iphone_14_pro_twentyfive_screen';

  static const String iphone14ProTwentysevenScreen =
      '/iphone_14_pro_twentyseven_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  // my routes
  static const String homeSplash = '/home_splash';
  static const String signUp = '/sign_up';
  static const String signIn = '/sign_in';
  static const String homeScreen = '/home_screen';
  static const String chooseGoal = '/choose_goal';
  static const String customDialog = '/custom_dialog';
  static const String write = '/write';
  static const String verifyDetails = '/verify_details';
  static const String userProfile = '/user_Profile';
  static const String blessingDetails = '/blessing_details';
  static const String blessingWithdraw = '/blessing_withdraw';
  static const String bankDetails = '/bank_details';
  static const String confirmDetails = '/confirm_details';
  static const String requestDialog = '/request_dialog';
  static const String requestChanges = '/request_changes';
  static const String requestProcessDialog = '/request_process_dialog';
  static const String withdrawSuccess = '/withdraw_success';
  static const String goalAchieve = '/goal_achieve';
  static const String exitPrayer = '/exit_prayer';
  static const String animate = '/animate';
  static const String forgot = '/forgot';
  static const String splash = '/splash';
  static const String googlesignin = '/googlesignin';

  static Map<String, WidgetBuilder> routes = {
    // my routes
    homeSplash: (context) => HomeSplash(),
    signUp: (context) => SignUp(),
    signIn: (context) => SignIn(),
    homeScreen: (context) => HomeScreen(),
    chooseGoal: (context) => ChooseGoal(),
    customDialog: (context) => CustomDialog(),
    write: (context) => Write(),
    verifyDetails: (context) => VerifyDetails(),
    userProfile: (context) => UserProfile(),
    blessingDetails: (context) => BlessingDetails(),
    blessingWithdraw: (context) => BlessingWithdraw(),
    bankDetails: (context) => BankDetails(),
    confirmDetails: (context) => ConfirmDetails(),
    requestDialog: (context) => RequestDialog(),
    requestChanges: (context) => RequestChanges(),
    requestProcessDialog: (context) => RequestProcessDialog(),
    withdrawSuccess: (context) => WithdrawSuccess(),
    goalAchieve: (context) => GoalAchieve(),
    exitPrayer: (context) => ExitPrayer(),
    animate: (context) => DisappearingTextFormFieldd(),
    forgot: (context) => Forgot(),
    splash: (context) => Splash(),
    googlesignin: (context) => AuthService().handleAuthState(),
  };
}
