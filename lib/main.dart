import 'package:flutter/material.dart';
import 'package:shop_app/providers/add_to_cart.dart';
import 'package:shop_app/providers/count.dart';
import 'package:shop_app/providers/slider.dart';
import 'package:shop_app/screen/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountProvider()),
        ChangeNotifierProvider(create: (context) => SliderProvider()),
        ChangeNotifierProvider(create: (context) => AddCartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.indigo[50],
          primarySwatch: Colors.indigo,
        ),
        home: HomePage(),
      ),
    );
  }
}
