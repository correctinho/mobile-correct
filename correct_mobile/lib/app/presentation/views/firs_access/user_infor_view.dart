import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/views/firs_access/date_input_format.dart';

import 'package:mobile_create/app/presentation/widgets_global/logo_widget.dart';
import 'package:mobile_create/app/presentation/widgets_global/main_button_widget.dart';

class UserInforView extends StatefulWidget {
  const UserInforView({super.key});

  @override
  State<UserInforView> createState() => _UserInforViewState();
}

class _UserInforViewState extends State<UserInforView> {
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: CustomColors.backGroundColor,
                          ),
                          hintText: "Nome Completo",
                          hintStyle: TextStyle(color: CustomColors.backGroundColor),
                        ),
                      ),
                      TextFormField(
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
                          hintText: "Data de aniversario",
                          hintStyle: TextStyle(color: CustomColors.backGroundColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: MainButton(
                  color: CustomColors.backGroundColor,
                  text: 'Continuar',
                  height: 50,
                  textColor: CustomColors.white,
                  borderRadius: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
