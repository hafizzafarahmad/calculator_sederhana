import 'package:flutter/material.dart';
import 'package:kalkulator_sederhana/kalkulator_provider.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<KalkulatorProvider>(create: (_) => KalkulatorProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kalkulator',
        theme: ThemeData(
          primaryColor: Colors.deepOrange,
          accentColor: Colors.deepOrange,
        ),
        home: Home(),
      ),
    );
  }
}
