import "package:provider/provider.dart";
import "package:flutter/material.dart";
import "package:frontend/viewmodels/auth_viewmodel.dart";
import "package:frontend/core/providers/user_provider.dart";

class DashboardView extends StatelessWidget {
  static String id = "/dashboard";

  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final data = userProvider.getUserData();
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.network(data?["photoUrl"]),
      Text("${data}"),
      ElevatedButton(
          onPressed: () => AuthViewModel().signOutGoogle(),
          child: const Text("Logout"))
    ])));
  }
}
