import 'package:flutter/material.dart';
import 'package:weather/page/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      home: WeatherPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
