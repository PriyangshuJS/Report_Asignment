import 'package:flutter/material.dart';
import 'package:report/report.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Report Page',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:  const ReportWidget(),
    );
  }
}
