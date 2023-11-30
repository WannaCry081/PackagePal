import "package:flutter/material.dart";
import "package:frontend/routes.dart";

void main(){
  
  runApp( const MyApp() );
  return;
}

class MyApp extends StatelessWidget {
  const MyApp({ Key ? key }) : super(key : key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title : "PackagePal",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes : routes
    );
  }
}