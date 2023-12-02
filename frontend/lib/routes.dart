import "package:flutter/material.dart";
import "package:frontend/views/Onboarding/index.dart";
import "package:frontend/views/Dashboard/index.dart";
import "package:frontend/views/ForgotPassword/index.dart";
import "package:frontend/views/Login/index.dart";
import "package:frontend/views/Register/index.dart";

Map<String, Widget Function(BuildContext)> routes = {
  "/" : (context) {
    return OnboardingView();
  },

  "/aut/login" : (context) {
    return const LoginView();
  },

  "/auth/register" :  (context) {
    return const RegisterView();
  },

  "auth/forgot-password" : (context) {
    return const ForgotPasswordView();
  },

  "/dashboard" : (context){
    return const Dashboard();
  },

  "/dashboard/setting/change-pin" : (context) {
    return Container();
  }
};