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
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: const LogoWidget(height: 240, width: 240),
        ),
      ),
    );
  }
}
