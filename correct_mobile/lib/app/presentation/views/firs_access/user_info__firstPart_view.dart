import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/controllers/auth/register_controller.dart';
import 'package:mobile_create/app/presentation/views/firs_access/date_input_format.dart';
import 'package:mobile_create/app/presentation/views/firs_access/user_info_secondPart_view.dart';
import 'package:mobile_create/app/presentation/widgets_global/logo_widget.dart';
import 'package:mobile_create/app/presentation/widgets_global/main_button_widget.dart';

class UserInfoFirstPart extends StatefulWidget {
  const UserInfoFirstPart({super.key});

  @override
  State<UserInfoFirstPart> createState() => _UserInfoFirstPartState();
}

class _UserInfoFirstPartState extends State<UserInfoFirstPart> {
  var registerController = GetIt.I.get<RegisterController>();
  final _formKey = GlobalKey<FormState>();
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
                child: const LogoWidget(height: 150, width: 150),
              ),
              const Text(
                'Vamos começar',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.backGroundColor,
                ),
              ),
              const Text(
                'Forneça mais detalhes sobre você',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: CustomColors.backGroundColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(
                  height: size.height * 0.3,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          onChanged: (String value) => registerController.userAdditionalInfoModel.fullname = value,
                          validator: (value) {
                            if (value == "" || value == null) return "Por favor informe seu nome";
                            return null;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: CustomColors.backGroundColor,
                            ),
                            hintText: "Nome Completo *",
                            hintStyle: TextStyle(color: CustomColors.backGroundColor),
                          ),
                        ),
                        TextFormField(
                          onChanged: (String value) => registerController.userAdditionalInfoModel.phone = value,
                          validator: (value) {
                            //  if (!value!.isValidPhone) return "Numero de telefone invalido";
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: CustomColors.backGroundColor,
                            ),
                            hintText: "Telefone",
                            hintStyle: TextStyle(color: CustomColors.backGroundColor),
                          ),
                        ),
                        TextFormField(
                          onChanged: (String value) => registerController.userAdditionalInfoModel.dateOfBirth = value,
                          validator: (value) {
                            if (value == "" || value == null) return "Por favor informe sua data de nascimento";
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            DateInputFormatter(),
                          ],
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.cake,
                              color: CustomColors.backGroundColor,
                            ),
                            hintText: "Data de aniversario *",
                            hintStyle: TextStyle(color: CustomColors.backGroundColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Observer(builder: (_) {
                  return InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserInfoSecondPartView()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(registerController.response)),
                        );
                      }
                    },
                    child: const MainButton(
                      color: CustomColors.backGroundColor,
                      text: 'Continuar',
                      height: 50,
                      textColor: CustomColors.white,
                      borderRadius: 15,
                      fontSize: 22,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
