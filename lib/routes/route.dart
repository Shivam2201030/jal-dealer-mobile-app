
import 'package:flutter/material.dart';
import 'package:jindal_dealer/screens/auth/screen_login.dart';


class RouteGenerator {

  static Route? generateRoute(RouteSettings settings) {
    // Getting arguments passed while calling Navigator.pushNamed
    //final args = settings.arguments;
    switch (settings.name) {


      case ScreenLogin.routeName:  ///Subscription checking screen
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ScreenLogin(),);

      /*case ScreenSubscription.routeName:  ///Plan Subscription screen
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ScreenSubscription());*/


      default:
        MaterialPageRoute(
            settings: settings, builder: (_) => const Text("No Screen found"));
    }
    return null;
  }
}