import "package:flutter/material.dart";
import "package:frontend/models/user_model.dart";
import "package:provider/provider.dart";
import "package:frontend/core/providers/user_provider.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:frontend/views/Dashboard/index.dart";
import "package:frontend/views/Error/index.dart";
import "package:frontend/views/Loading/index.dart";

class AuthRouteHoc extends StatelessWidget {
  final Widget child;

  const AuthRouteHoc({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingView();
          } else if (snapshot.hasData) {
            User user = FirebaseAuth.instance.currentUser!;
            Map<String, dynamic> userData = {
              'uid': user.uid,
              'email': user.email,
              'displayName': user.displayName,
              'photoUrl': user.photoURL,
              'address': "",
              'contactNumber': "",
            };
            userProvider.setUserData(userData);
            return LoadingView(child: DashboardView());
          } else if (snapshot.hasError) {
            return const ErrorView();
          } else {
            return LoadingView(child: child);
          }
        });
  }
}
