import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class LoadingView extends StatelessWidget {
  final Widget? child;
  final Future isLoading = Future.delayed(const Duration(milliseconds: 2800));

  LoadingView({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: isLoading,
        builder: (context, snapshot) {
          if (child != null) {
            if (snapshot.connectionState == ConnectionState.done) {
              return child!;
            }
          }

          return Scaffold(
              body: Center(
                  child: SpinKitDancingSquare(
                      color: Theme.of(context).colorScheme.tertiary,
                      size: 50)));
        });
  }
}
