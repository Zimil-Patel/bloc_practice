import 'package:bloc_practice/config/routes/routes_name.dart';
import 'package:bloc_practice/view/views.dart';
import 'package:flutter/material.dart';

class Routes{
  static Route<dynamic> generateRoutes(RouteSettings settings){

    switch(settings.name){

      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());

        case RouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case RouteName.myLoginScreen:
        return MaterialPageRoute(builder: (context) => MyLoginScreen());

      default:
        return MaterialPageRoute(builder: (context) => Scaffold(body: Center(child: Text('No Route Found'))));
    }

  }
}