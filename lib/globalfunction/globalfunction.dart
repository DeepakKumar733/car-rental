
import 'package:flutter/material.dart';


class Twl {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static navigateTo(BuildContext context, page) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
 static forceNavigateToReplacement(BuildContext context, page) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
  

  static navigateBack(BuildContext context) async {
    Navigator.pop(context);
  }

  

  static forceNavigateTo(BuildContext context, page) async {
    Navigator.pushReplacement(context,
         MaterialPageRoute(builder: (BuildContext context) => page));
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => page),
    // );
  }
}
