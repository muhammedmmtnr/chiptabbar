
import 'package:chiptabbar/guide_us.dart';
import 'package:chiptabbar/Translatorsprovider.dart';
import 'package:chiptabbar/guideprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
       ChangeNotifierProvider( create: (context) => WriterProvider(),),
       ChangeNotifierProvider(create: (context) => GuideProvider(),
      
    ),

    ],
    child: const MyApp(),)
    
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:  GuideScreen(),
    );
  }
}

