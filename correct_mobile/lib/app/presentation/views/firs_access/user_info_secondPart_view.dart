import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/controllers/auth/register_controller.dart';
import 'package:mobile_create/app/presentation/controllers/user/user_controller.dart';
import 'package:mobile_create/app/presentation/views/firs_access/address_view.dart';
import 'package:mobile_create/app/presentation/widgets_global/logo_widget.dart';
import 'package:mobile_create/app/presentation/widgets_global/main_button_widget.dart';

class UserInfoSecondPartView extends StatefulWidget {
  const UserInfoSecondPartView({super.key});

  @override
  State<UserInfoSecondPartView> createState() => _UserInfoSecondPartViewState();
}

class _UserInfoSecondPartViewState extends State<UserInfoSecondPartView> {
  var registerController = GetIt.I.get<RegisterController>();
  var userController = GetIt.I.get<UserController>();
  final List<String> genderOptions = ['Masculino', 'Feminino', 'Outro'];
  String? selectedGender;
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
                'Está quase lá!',
                style: TextStyle(
                  fontSize: 22,
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
                        DropdownButtonFormField<String>(
                          value: selectedGender,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedGender = newValue;
                            });
                          },
                          items: [
                            DropdownMenuItem<String>(
                              value: genderOptions[0],
                              child: Text(genderOptions[0]),
                            ),
                            DropdownMenuItem<String>(
                              value: genderOptions[1],
                              child: Text(genderOptions[1]),
                            ),
                            DropdownMenuItem<String>(
                              value: genderOptions[2],
                              child: Text(genderOptions[2]),
                            ),
                          ],
                          decoration: const InputDecoration(
                            hintText: 'Gênero *',
                            hintStyle: TextStyle(color: CustomColors.backGroundColor),
                            prefixIcon: const Icon(Icons.wc),
                          ),
                        ),
                        TextFormField(
                          onChanged: (String value) => registerController.userAdditionalInfoModel.recommendationCode = value,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.password,
                              color: CustomColors.backGroundColor,
                            ),
                            labelText: 'Codigo de recomendação',
                            labelStyle: TextStyle(color: CustomColors.backGroundColor),
                          ),
                        ),
                        TextFormField(
                          onChanged: (String value) => registerController.userAdditionalInfoModel.maritalStatus = value,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.description_outlined,
                              color: CustomColors.backGroundColor,
                            ),
                            labelText: 'Estado civil *',
                            labelStyle: TextStyle(color: CustomColors.backGroundColor),
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
                      await registerController.registerAdditionalInfo();
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddressView()));
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
