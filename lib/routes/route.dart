
import 'package:flutter/material.dart';
import 'package:jindal_dealer/screens/Create_Order/screen_order_list.dart';
import 'package:jindal_dealer/screens/auth/screen_login.dart';
import 'package:jindal_dealer/screens/create_order/create_order_view.dart';

class RouteGenerator {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ScreenLogin.routeName:  ///Subscription checking screen
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ScreenLogin(),);
      case ScreenOrderList.routeName:  ///Subscription checking screen
        return MaterialPageRoute(
          settings: settings, builder: (_) => const ScreenOrderList(),);
      case ScreenCreateOrder.routeName:  ///Subscription checking screen
        return MaterialPageRoute(
          settings: settings, builder: (_) =>  ScreenCreateOrder(),);
      // case AddOrderMaterials.routeName:  ///Subscription checking screen
      //   return MaterialPageRoute(
      //     settings: settings, builder: (_) => const AddOrderMaterials(),);





    // case ScreenOrderList.routeName:
        // return MaterialPageRoute(
        //   settings: settings, builder: (_) => const ScreenOrderList(),);
        default:
        MaterialPageRoute(
            settings: settings, builder: (_) => const Text("No Screen found"));
    }
    return null;
  }
}