import 'package:flutter/material.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/core/routes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: CustomColors.ligthGrey,
          toolbarHeight: 100,
        ),
        checkboxTheme: const CheckboxThemeData(
          fillColor: MaterialStatePropertyAll(CustomColors.grey),
          checkColor: MaterialStatePropertyAll(CustomColors.blue),
          side: BorderSide(
            color: CustomColors.blue,
            width: 2,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(color: CustomColors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: CustomColors.backGroundColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: CustomColors.backGroundColor),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: routes,
    );
  }
}
