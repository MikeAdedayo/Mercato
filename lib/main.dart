import 'package:flutter/material.dart';
import 'landingpage/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: Scaffold(
          body: Home(),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(title: Text('Home'), icon: Icon(Icons.home)),
              BottomNavigationBarItem(title: Text('time'), icon: Icon(Icons.access_time)),
              ],
          ),
          backgroundColor: Color(0xffeeeeee),
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
        ) 
        );
  }
}
