import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:frontend/views/Dashboard/index.dart";
import "package:frontend/views/Error/index.dart";
import "package:frontend/views/Loading/index.dart";

class PrivateRouteHoc extends StatelessWidget {
  final Widget child;

  const PrivateRouteHoc({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingView();
          } else if (snapshot.hasData) {
            return const DashboardView();
          } else if (snapshot.hasError) {
            return const ErrorView();
          } else {
            return child;
          }
        });
  }
}
