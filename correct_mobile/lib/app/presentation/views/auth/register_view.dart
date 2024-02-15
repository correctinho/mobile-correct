import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/controllers/auth/register_controller.dart';
import 'package:mobile_create/app/presentation/utils/snack_bar.dart';
import 'package:mobile_create/app/presentation/widgets_global/logo_widget.dart';
import 'package:mobile_create/app/presentation/widgets_global/main_button_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var registerController = GetIt.I.get<RegisterController>();

  // Future signUpMiddleware() async {
  //   bool res = await registerController.register();
  //   if (res) {
  //     if (mounted) {
  //       Navigator.of(context).pushReplacementNamed('/home');
  //     }
  //   } else {
  //     if (mounted) {
  //       showSnackBar(context, 'Não foi possível fazer o Cadastro');
  //     }
  //   }
  // }

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
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                alignment: Alignment.center,
                child: const LogoWidget(height: 200, width: 200),
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                width: size.width * 0.9,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (String value) =>
                                registerController.cpf = value,
                            keyboardType: TextInputType.number,
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
                                borderSide:
                                    const BorderSide(color: CustomColors.white),
                              ),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: CustomColors.white,
                              ),
                              hintText: 'CPF',
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
                            onChanged: (String value) =>
                                registerController.email = value,
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
                                borderSide:
                                    const BorderSide(color: CustomColors.white),
                              ),
                              prefixIcon: const Icon(
                                Icons.mail,
                                color: CustomColors.white,
                              ),
                              hintText: 'E-mail',
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
                            onChanged: (String value) =>
                                registerController.password = value,
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
                                borderSide:
                                    const BorderSide(color: CustomColors.white),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: CustomColors.white,
                              ),
                              hintText: 'Password',
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
                            onChanged: (String value) =>
                                registerController.confirmPass = value,
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
                                borderSide:
                                    const BorderSide(color: CustomColors.white),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: CustomColors.white,
                              ),
                              hintText: 'Confirm Password',
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        await registerController.register();
                        if (registerController.canRegister) {
                          if (mounted) {
                            showSnackBar(context, 'Usuário criado!');
                          }
                        } else {
                          if (mounted) {
                            showSnackBar(context, registerController.response);
                          }
                        }
                      },
                      child: const MainButton(
                        text: 'Sign Up',
                        color: CustomColors.white,
                        height: 50,
                        textColor: Color(0xFF012B42),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
