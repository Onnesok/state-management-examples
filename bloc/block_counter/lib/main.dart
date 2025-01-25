import 'package:block_counter/counter/counter_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          const CounterPage(),
          Banner(
              message: "Bloc",
              textStyle: const TextStyle(color: Colors.red),
              location: BannerLocation.topStart,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
