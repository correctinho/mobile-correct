import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/core/routes.dart';
import 'package:mobile_create/app/data/models/show_case_view_model.dart';
import 'package:mobile_create/app/domain/repositories/show_case_repository.dart';
import 'package:mobile_create/app/domain/usecases/shared/show_case_use_case.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShowcaseViewModel(
        itemRepository: ItemRepository(
          ItemUseCase(),
        ),
      ),
      child: MaterialApp(
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
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(color: CustomColors.white),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: routes,
      ),
    );
  }
}
