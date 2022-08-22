
import 'package:tyba_test/src/pages/home_page.dart';
import 'package:tyba_test/src/pages/listview_universities.dart';
import 'package:tyba_test/src/routes/routes.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universidades APP',
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute:  '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: ( RouteSettings settings ) {
         return MaterialPageRoute(
           builder: (BuildContext context) => HomePage()
         );
      },
    );
  }
}