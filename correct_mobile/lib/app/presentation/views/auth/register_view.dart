import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/core/regex_extensions.dart';
import 'package:mobile_create/app/presentation/controllers/auth/register_controller.dart';
import 'package:mobile_create/app/presentation/views/auth/login_view.dart';
import 'package:mobile_create/app/presentation/views/auth/widgets/success_register_view.dart';
import 'package:mobile_create/app/presentation/views/auth/widgets/text_form_field_widget.dart';
import 'package:mobile_create/app/presentation/widgets_global/logo_widget.dart';
import 'package:mobile_create/app/presentation/widgets_global/main_button_widget.dart';
import 'package:mobile_create/app/presentation/widgets_global/toast_error_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var registerController = GetIt.I.get<RegisterController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ValueNotifier<bool> isLoading = ValueNotifier(false);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const LogoWidget(height: 240, width: 240),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: SizedBox(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            onChanged: (String value) => registerController.userIdentityInfoModel.document = value,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CpfInputFormatter(),
                            ],
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: CustomColors.backGroundColor,
                              ),
                              hintText: 'CPF',
                              hintStyle: TextStyle(color: CustomColors.backGroundColor),
                            ),
                            obscureText: false,
                            validator: (val) {
                              if (!val!.isValiCPF) return 'Insira um CPF valido';
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormFieldWidget(
                              onChanged: (String value) => registerController.userIdentityInfoModel.email = value,
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: const Icon(
                                Icons.mail,
                                color: CustomColors.backGroundColor,
                              ),
                              hinText: "E-mail",
                              obscureText: false,
                              validator: (val) {
                                if (!val!.isValidEmail) return 'Entre com um E-mail valido';
                                return null;
                              }),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            onChanged: (String value) => registerController.userIdentityInfoModel.password = value,
                            obscureText: true,
                            validator: (val) {
                              if (!val!.isValidPassword) return 'Senhas devem conter uma letra maiúscula e 8 caracteres';
                              return null;
                            },
                            style: const TextStyle(color: CustomColors.backGroundColor),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: CustomColors.backGroundColor,
                              ),
                              hintText: 'Senha',
                              hintStyle: TextStyle(color: CustomColors.backGroundColor),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            onChanged: (String value) => registerController.confirmPass = value,
                            obscureText: true,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Por favor, confirme sua senha';
                              }
                              if (val != registerController.userIdentityInfoModel.password) {
                                return 'As senhas não coincidem';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: CustomColors.backGroundColor,
                              ),
                              hintText: 'Confirmar Senha',
                              hintStyle: TextStyle(color: CustomColors.backGroundColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    try {
                      isLoading.value = true;

                      if (_formKey.currentState!.validate()) {
                        await registerController.register();
                        if (registerController.response == 'created') {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const RegistrationResponseWidget(
                                text: 'Obaa!! Sua conta Correct foi criada. É um prazer tê-lo conosco',
                                img: 'assets/png/robot_success.png',
                                route: '/login',
                                textButton: 'Começar a usar o App',
                              ),
                            ),
                          );
                        } else {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const RegistrationResponseWidget(
                                text: 'Ops!! Sua conta Correct, infelizmente, não foi criada. Usuário Já cadastrado',
                                img: 'assets/png/robot_error.png',
                                route: '/sign-up',
                                textButton: 'Tente Novamente',
                              ),
                            ),
                          );
                        }
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const ToastErrorWidget(
                          messageError: 'Usuario Ja cadastrado! Efuetuar login',
                        ).build(context) as SnackBar,
                      );
                    } finally {
                      isLoading.value = false;
                    }
                  },
                  child: ValueListenableBuilder<bool>(
                      valueListenable: isLoading,
                      builder: (context, loading, child) {
                        return loading
                            ? const CircularProgressIndicator()
                            : const MainButton(
                                text: 'CADASTRAR-SE',
                                color: CustomColors.backGroundColor,
                                height: 60,
                                textColor: CustomColors.white,
                                borderRadius: 50,
                                fontSize: 22,
                              );
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ),
                    );
                  },
                  child: const Text(
                    'Já possui uma conta? Efetue seu login aqui',
                    style: TextStyle(
                      color: CustomColors.backGroundColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
