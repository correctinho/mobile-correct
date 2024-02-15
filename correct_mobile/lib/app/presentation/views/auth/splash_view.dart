import 'package:flutter/material.dart';
import 'package:mobile_create/app/presentation/widgets_global/logo_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 5),
    ).then(
      (_) => Navigator.of(context).pushReplacementNamed('/login-or-signup'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0xFF002B43),
                    Color(0xFF002F48),
                    Color(0xFF021E2D),
                  ]),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: const LogoWidget(height: 200, width: 200),
          )
        ],
      ),
    ));
  }
}
