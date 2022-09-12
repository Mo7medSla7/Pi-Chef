import 'package:flutter/material.dart';
import 'package:foods_app/modules/layout/Layout_Screen.dart';
import 'package:foods_app/modules/login_screen/login_screen.dart';
import 'package:foods_app/network/api_helper.dart';
import 'package:provider/provider.dart';

import 'modules/home_screen/home_screen.dart';
import 'modules/on_boarding_screen/on_boarding_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ProviderHelper.getAllFoods();
  ProviderHelper.getRandomPizza();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderHelper(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: OnBoardingScreen(),
      ),
    );
  }
}

