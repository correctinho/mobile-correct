import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/controllers/auth/auth_controller.dart';
import 'package:mobile_create/app/presentation/widgets_global/logo_widget.dart';

class LoginOrSignUp extends StatefulWidget {
  const LoginOrSignUp({super.key});

  @override
  State<LoginOrSignUp> createState() => _LoginOrSignUpState();
}

class _LoginOrSignUpState extends State<LoginOrSignUp> {
  var authController = GetIt.instance.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Suas compras geram cashback!',
            style: TextStyle(
              color: CustomColors.backGroundColor,
              fontSize: 20,
            ),
          ),
          const LogoWidget(height: 240, width: 240),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(23),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: CustomColors.backGroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: const BorderSide(
                            color: Color(0xFF9EFB72),
                            width: 3,
                          ),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: CustomColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed('/sign-up'),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: CustomColors.buttonRegister,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Cadastro',
                          style: TextStyle(
                            color: Color(0xFF012B42),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
