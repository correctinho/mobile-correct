import 'package:flutter/material.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/views/auth/login_view.dart';
import 'package:mobile_create/app/presentation/widgets_global/main_button_widget.dart';

class SuccessRegisterView extends StatefulWidget {
  const SuccessRegisterView({super.key});

  @override
  State<SuccessRegisterView> createState() => _SuccessRegisterViewState();
}

class _SuccessRegisterViewState extends State<SuccessRegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/png/robot_success.png'),
                const Text(
                  'Obaa!! Sua conta Correct foi criada. É um prazer tê-lo conosco',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40.0,
            right: 40,
            left: 40,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ),
                );
              },
              child: const MainButton(
                text: 'Começar a usar o App',
                color: CustomColors.ligthBlue,
                height: 54,
                textColor: CustomColors.white,
                borderRadius: 20,
                fontSize: 17,
              ),
            ),
          )
        ],
      ),
    );
  }
}
