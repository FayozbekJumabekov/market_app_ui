import 'package:flutter/material.dart';
import 'package:market_app_ui/shop_cart.dart';

import 'home_page.dart';

void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: HomePage(),
      routes: {

        HomePage.id:(context)=>HomePage(),
        ShoppingCart.id:(context)=>ShoppingCart([]),
      },

    );
  }
}
