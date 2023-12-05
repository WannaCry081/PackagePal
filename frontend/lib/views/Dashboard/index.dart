import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:frontend/viewmodels/auth_viewmodel.dart";
import "package:provider/provider.dart";
import "package:frontend/core/providers/user_provider.dart";

class DashboardView extends StatelessWidget {
  const DashboardView({ Key ? key }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      body : Center(
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children : [
            Text("${FirebaseAuth.instance.currentUser?.displayName}"),
            ElevatedButton(onPressed: () => AuthViewModel().signOutGoogle(), child: Text("Logout"))
          ]
        )
      )
    );
  }
}