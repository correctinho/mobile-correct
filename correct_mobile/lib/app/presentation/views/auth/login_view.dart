import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/controllers/auth/auth_controller.dart';
import 'package:mobile_create/app/presentation/utils/snack_bar.dart';
import 'package:mobile_create/app/presentation/views/firs_access/details_check_view.dart';
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
      body: Container(
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
            ])),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const LogoWidget(height: 200, width: 200),
                ),
                const SizedBox(
                  height: 100,
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
                              onChanged: (String value) =>
                                  authController.cpf = value,
                              // keyboardType: TextInputType.number,
                              // inputFormatters: [
                              //   FilteringTextInputFormatter.digitsOnly,
                              //   CpfInputFormatter(),
                              // ],
                              style: const TextStyle(color: CustomColors.white),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(
                                    color: CustomColors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(
                                      color: CustomColors.white),
                                ),
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: CustomColors.white,
                                ),
                                hintText: 'CPF',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: [
                      //     Expanded(
                      //       child: TextFormField(
                      //         onChanged: (String value) =>
                      //             authController.email = value,
                      //         keyboardType: TextInputType.emailAddress,
                      //         style: const TextStyle(color: CustomColors.white),
                      //         decoration: const InputDecoration(
                      //           prefixIcon: Icon(
                      //             Icons.mail,
                      //             color: CustomColors.white,
                      //           ),
                      //           hintText: 'E-mail',
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: TextFormField(
                              onChanged: (String value) =>
                                  authController.password = value,
                              keyboardType: TextInputType.number,
                              // inputFormatters: [
                              //   FilteringTextInputFormatter.digitsOnly,
                              // ],
                              obscureText: true,
                              style: const TextStyle(color: CustomColors.white),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(
                                    color: CustomColors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(
                                      color: CustomColors.white),
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: CustomColors.white,
                                ),
                                hintText: 'Password',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Observer(builder: (context) {
                        if (!authController.loading) {
                          return InkWell(
                            onTap: () async {
                              //   await authController.login();
                              //   if (authController.response == 'logedin') {
                              //     if (mounted && authController.isFirst) {
                              //       if (authController.isFirst) {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         const DetailsCheckView(),
                              //   ),
                              //         );
                              //       } else {
                              //         Navigator.of(context).push(
                              //           MaterialPageRoute(
                              //             builder: (context) =>
                              //                 const HomeNavigationView(),
                              //           ),
                              //         );
                              //         showSnackBar(context, 'Bem vindo!');
                              //       }
                              //     }
                              //   } else {
                              //     if (mounted) {
                              //       showSnackBar(
                              //           context, authController.response);
                              //     }
                              //   }
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const DetailsCheckView(),
                                ),
                              );
                            },
                            child: const MainButton(
                              color: CustomColors.white,
                              text: 'Sign in',
                              height: 50,
                              textColor: Color(0xFF012B42),
                            ),
                          );
                        } else {
                          return const CircularProgressIndicator(
                              color: CustomColors.white);
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
      ),
    );
  }
}
