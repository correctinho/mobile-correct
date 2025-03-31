import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/core/dependency_injection.dart';
import 'package:mobile_create/app/core/regex_extensions.dart';
import 'package:mobile_create/app/domain/services/locationPermission_service.dart';
import 'package:mobile_create/app/presentation/controllers/auth/auth_controller.dart';
import 'package:mobile_create/app/presentation/controllers/user/outputAppUser_controller.dart';
import 'package:mobile_create/app/presentation/controllers/user/userAddress_controller.dart';
import 'package:mobile_create/app/presentation/controllers/user/userBenefits_controller.dart';
import 'package:mobile_create/app/presentation/controllers/user/user_controller.dart';
import 'package:mobile_create/app/presentation/utils/snack_bar.dart';
import 'package:mobile_create/app/presentation/views/auth/recoverPassword_view.dart';
import 'package:mobile_create/app/presentation/views/auth/register_view.dart';
import 'package:mobile_create/app/presentation/views/firs_access/address_view.dart';
import 'package:mobile_create/app/presentation/views/firs_access/details_check_view.dart';
import 'package:mobile_create/app/presentation/views/firs_access/user_info__firstPart_view.dart';
import 'package:mobile_create/app/presentation/views/home/home_naviagtion_view.dart';
import 'package:mobile_create/app/presentation/views/token/token_view.dart';
import 'package:mobile_create/app/presentation/widgets_global/main_button_widget.dart';
import 'package:mobile_create/app/presentation/widgets_global/logo_widget.dart';
import 'package:mobile_create/app/presentation/widgets_global/toast_error_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var authController = GetIt.I.get<AuthController>();
  var userController = GetIt.I.get<UserController>();
  var outputAppUserController = GetIt.I.get<OutputAppUserDetailsController>();
  var userAddressController = GetIt.I.get<GetUserAddressController>();
  var userBenefitsController = GetIt.I.get<UserBenefitsController>();
  final LocationPermissionService _permissionService = getIt<LocationPermissionService>();
  final _formKey = GlobalKey<FormState>();

  Future<void> _requestLocationPermission(BuildContext context) async {
    bool hasPermission = await _permissionService.requestLocationPermission();

    if (hasPermission) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomeNavigationView(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const ToastErrorWidget(messageError: 'Permissão de localização é necessária para usar o app.').build(context) as SnackBar,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: const LogoWidget(height: 240, width: 240),
              ),
              SizedBox(
                width: size.width * 0.9,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: TextFormField(
                              validator: (val) {
                                if (val == null || !val.isValiCPF) return 'Insira um CPF Valido';
                                return null;
                              },
                              onChanged: (String value) => authController.cpf = value,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                CpfInputFormatter(),
                              ],
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
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: TextFormField(
                              validator: (val) {
                                if (val == null || !val.isValidPassword) return 'Senhas devem conter uma letra maiúscula e 8 caracteres';
                                return null;
                              },
                              onChanged: (String value) => authController.password = value,
                              obscureText: true,
                              style: const TextStyle(color: CustomColors.backGroundColor),
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: CustomColors.backGroundColor,
                                ),
                                hintText: 'Password',
                                hintStyle: TextStyle(color: CustomColors.backGroundColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Observer(builder: (context) {
                        if (!authController.loading) {
                          return InkWell(
                            onTap: () async {
                              if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                                await authController.login();
                                if (authController.response == 'logedin') {
                                  await outputAppUserController.getOutputAppUserDetails();

                                  if (!outputAppUserController.outputAppUserDetailsModel.status) {
                                    if (!outputAppUserController.outputAppUserDetailsModel.userInfo) {
                                      Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(builder: (context) => const UserInfoFirstPart()),
                                        (Route<dynamic> route) => false,
                                      );
                                      return;
                                    }
                                    if (!outputAppUserController.outputAppUserDetailsModel.userAddress) {
                                      Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(builder: (context) => const AddressView()),
                                        (Route<dynamic> route) => false,
                                      );
                                      return;
                                    }
                                    if (!outputAppUserController.outputAppUserDetailsModel.userValidation) {
                                      Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(builder: (context) => const DetailsCheckView()),
                                        (Route<dynamic> route) => false,
                                      );
                                      return;
                                    }
                                  } else {
                                    await userController.getUserDetails();
                                    await userAddressController.getUserAddress();
                                    await userBenefitsController.getUserBenefits();
                                    await _requestLocationPermission(context);
                                  }
                                } else {
                                  if (mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      ToastErrorWidget(messageError: authController.response).build(context) as SnackBar,
                                    );
                                  }
                                }
                              }
                            },
                            child: const MainButton(
                              color: CustomColors.backGroundColor,
                              text: 'Login',
                              height: 50,
                              textColor: CustomColors.white,
                              borderRadius: 15,
                              fontSize: 22,
                            ),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RecoverPassWordView()));
                },
                child: const Text(
                  'Esqueceu sua senha?',
                  style: TextStyle(
                    color: CustomColors.backGroundColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterView()));
                },
                child: const Text(
                  'Não possui uma conta? Cadastre-se ja',
                  style: TextStyle(
                    color: CustomColors.backGroundColor,
                    decoration: TextDecoration.underline,
                  ),
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
                  style: TextStyle(color: CustomColors.backGroundColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
