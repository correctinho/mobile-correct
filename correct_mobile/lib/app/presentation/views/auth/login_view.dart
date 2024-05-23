import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/controllers/auth/auth_controller.dart';
import 'package:mobile_create/app/presentation/utils/snack_bar.dart';
import 'package:mobile_create/app/presentation/views/firs_access/details_check_view.dart';
import 'package:mobile_create/app/presentation/views/home/home_naviagtion_view.dart';
import 'package:mobile_create/app/presentation/views/token/token_view.dart';
import 'package:mobile_create/app/presentation/widgets_global/main_button_widget.dart';
import 'package:mobile_create/app/presentation/widgets_global/logo_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var authController = GetIt.I.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.center,
                child: const LogoWidget(height: 240, width: 240),
              ),
              SizedBox(
                width: size.width * 0.9,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (String value) => authController.cpf = value,
                            // keyboardType: TextInputType.number,
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.digitsOnly,
                            //   CpfInputFormatter(),
                            // ],
                            style: const TextStyle(color: CustomColors.backGroundColor),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: CustomColors.backGroundColor,
                              ),
                              hintText: 'CPF',
                              hintStyle: TextStyle(color: CustomColors.backGroundColor),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(color: CustomColors.backGroundColor),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.mail,
                                color: CustomColors.backGroundColor,
                              ),
                              hintText: 'E-mail',
                              hintStyle: TextStyle(color: CustomColors.backGroundColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (String value) => authController.password = value,
                            keyboardType: TextInputType.number,
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.digitsOnly,
                            // ],
                            obscureText: true,
                            style: const TextStyle(color: CustomColors.backGroundColor),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: CustomColors.backGroundColor,
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: CustomColors.backGroundColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Observer(builder: (context) {
                      if (!authController.loading) {
                        print("if 1");
                        return InkWell(
                          onTap: () async {
                            await authController.login();
                            await authController.isFirstTime();
                            if (authController.response == 'logedin') {
                              print('if 2');
                              if (mounted && authController.isFirst) {
                                print('If 3');
                                print('if 4');
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const DetailsCheckView(),
                                  ),
                                );
                              } else {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const HomeNavigationView(),
                                  ),
                                );
                                showSnackBar(context, 'Bem vindo!');
                              }
                            } else {
                              if (mounted) {
                                showSnackBar(context, authController.response);
                              }
                            }
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         const DetailsCheckView(),
                            //   ),
                            // );
                          },
                          child: const MainButton(
                            color: CustomColors.backGroundColor,
                            text: 'Login',
                            height: 50,
                            textColor: CustomColors.white,
                            borderRadius: 50,
                          ),
                        );
                      } else {
                        return const CircularProgressIndicator(color: CustomColors.white);
                      }
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () async {
                  await authController.authFaceIdBio();
                  if (authController.faceId) {
                    if (mounted) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TokenView(),
                        ),
                      );
                    }
                  } else {
                    if (mounted) {
                      showSnackBar(context, 'Por segurança adicione um pin');
                    }
                  }
                },
                child: const Text(
                  'Token Offline',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
