import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_2/provider/DialogProvider.dart';
import 'package:flutter_application_2/userpage.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => DialogProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RingtoneList(),
    );
  }
}
