import "package:flutter/material.dart";
import "package:frontend/hocs/initial_route.dart";
import "package:frontend/views/Dashboard/index.dart";
import "package:frontend/views/Error/index.dart";
import "package:frontend/views/ForgotPassword/index.dart";
import "package:frontend/views/Loading/index.dart";
import "package:frontend/views/Login/index.dart";
import "package:frontend/views/Onboarding/index.dart";
import "package:frontend/views/Register/index.dart";

Map<String, Widget Function(BuildContext)> routes = {
  OnboardingView.id: (context) {
    return InitialRoute(
      toRouteChild: LoadingView(child: const DashboardView()),
      fromRouteChild: LoadingView(child: const OnboardingView()),
    );
  },
  LoginView.id: (context) => const LoginView(),
  RegisterView.id: (context) => const RegisterView(),
  ForgotPasswordView.id: (context) => const ForgotPasswordView(),
  ErrorView.id: (context) => const ErrorView(),
  DashboardView.id: (context) {
    return InitialRoute(
      toRouteChild: LoadingView(child: const DashboardView()),
      fromRouteChild: LoadingView(child: const OnboardingView()),
    );
  }
};
