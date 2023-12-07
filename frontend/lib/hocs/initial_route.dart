import "package:flutter/material.dart";
import "package:frontend/views/Error/index.dart";
import "package:provider/provider.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:frontend/core/providers/user_provider.dart";
import "package:frontend/models/user_model.dart";
import "package:frontend/views/Loading/index.dart";

class InitialRoute extends StatelessWidget {
  static String id = "/";

  final Widget fromRouteChild;
  final Widget toRouteChild;

  const InitialRoute(
      {Key? key, required this.fromRouteChild, required this.toRouteChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingView();
        } else if (snapshot.hasError) {
          return LoadingView(child: const ErrorView());
        } else if (snapshot.hasData) {
          User user = snapshot.data!;
          userProvider.setUserData(UserModel(
            uid: user.uid,
            email: user.email,
            displayName: user.displayName,
            photoUrl: user.photoURL,
          ));

          return toRouteChild;
        } else {
          return fromRouteChild;
        }
      },
    );
  }
}
