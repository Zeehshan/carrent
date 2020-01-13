
import 'package:flutter/material.dart';

class NavigationRouter{
  static void switchToLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, "/LoginScreen", (Route<dynamic> route) => false);
  }
  static void switchToMain(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, "/Main", (Route<dynamic> route) => false);
  }
  static void switchToCreateProcess(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, "/createProcess", (Route<dynamic> route) => false);
  }
  static void switchToMakeChoiceScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, "/MakeChoiceScreen", (Route<dynamic> route) => false);
  }
  static void switchSignUpScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, "/SignUpPage", (Route<dynamic> route) => false);
  }
  static void switchAccountCreatedScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, "/AccountCreatedPage", (Route<dynamic> route) => false);
  }
}