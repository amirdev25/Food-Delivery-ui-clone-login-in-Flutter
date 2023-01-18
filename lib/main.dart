import 'package:flutter/material.dart';
import 'package:food_delivery/ui/home_page.dart';
import 'package:food_delivery/ui/login_page.dart';
import 'package:food_delivery/utils/Constants.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Constants.LOGIN_PAGE,
      routes: {
        Constants.LOGIN_PAGE: (context) => LoginPage(),
        Constants.HOME_PAGE: (context) => HomePage()
      },
    );
  }
}
