import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/controllers/user/user_controller.dart';
import 'package:mobile_create/app/presentation/controllers/user/userAddress_controller.dart';
import 'package:mobile_create/app/presentation/views/firs_access/date_input_format.dart';
import 'package:mobile_create/app/presentation/widgets_global/logo_widget.dart';
import 'package:mobile_create/app/presentation/widgets_global/main_button_widget.dart';

class EditAdditioinalInforsView extends StatefulWidget {
  const EditAdditioinalInforsView({super.key});

  @override
  State<EditAdditioinalInforsView> createState() => _EditAdditioinalInforsViewState();
}

class _EditAdditioinalInforsViewState extends State<EditAdditioinalInforsView> {
  var userController = GetIt.I.get<UserController>();
  var userAddressController = GetIt.I.get<GetUserAddressController>();
  final _formKey = GlobalKey<FormState>();
  bool _isInputEnabled = false;
  var _textButton = 'Editar Dados';

  void _toggleInputEnabled() {
    setState(() {
      _isInputEnabled = !_isInputEnabled;
      _textButton = 'Confirmar alterações';
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const LogoWidget(height: 90, width: 90),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(
            children: [
              const Text('Dados pessoais'),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: SizedBox(
                  height: size.height * 0.8,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormField(
                          controller: TextEditingController(
                            text: userController.getFullUserInforModel.fullname.isEmpty ? 'Nome não informado' : userController.getFullUserInforModel.fullname,
                          ),
                          enabled: _isInputEnabled,
                          // onChanged: (String value) => registerController.userAdditionalInfoModel.function = value,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: CustomColors.backGroundColor,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: TextEditingController(
                            text: userController.getFullUserInforModel.document,
                          ),
                          enabled: false,
                          // onChanged: (String value) => registerController.userAdditionalInfoModel.function = value,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: CustomColors.backGroundColor,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: TextEditingController(
                            text: userController.getFullUserInforModel.email,
                          ),
                          enabled: _isInputEnabled,
                          // onChanged: (String value) => registerController.userAdditionalInfoModel.function = value,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: CustomColors.backGroundColor,
                            ),
                          ),
                        ),
                        TextFormField(
                          enabled: _isInputEnabled,
                          controller: TextEditingController(text: userController.getFullUserInforModel.phone),
                          // onChanged: (String value) => registerController.userAdditionalInfoModel.phone = value,
                          validator: (value) {
                            if (value == "" || value == null) return "Por favor informe seu numero de telefone";
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: CustomColors.backGroundColor,
                            ),
                          ),
                        ),
                        TextFormField(
                          enabled: _isInputEnabled,
                          controller: TextEditingController(text: userController.getFullUserInforModel.dateOfBirth),
                          //onChanged: (String value) => registerController.userAdditionalInfoModel.dateOfBirth = value,
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
                          ),
                        ),
                        TextFormField(
                          controller: TextEditingController(
                            text: userController.getFullUserInforModel.maritalStatus.isEmpty ? 'Estado civil não informado' : userController.getFullUserInforModel.maritalStatus,
                          ),
                          enabled: _isInputEnabled,
                          // onChanged: (String value) => registerController.userAdditionalInfoModel.maritalStatus = value,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.description_outlined,
                              color: CustomColors.backGroundColor,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: TextEditingController(
                            text: userController.getFullUserInforModel.gender,
                          ),
                          enabled: _isInputEnabled,
                          // onChanged: (String value) => registerController.userAdditionalInfoModel.function = value,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.wc,
                              color: CustomColors.backGroundColor,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: TextEditingController(
                            text: userController.getFullUserInforModel.document2.isEmpty ? 'RG não informado' : userController.getFullUserInforModel.document2,
                          ),
                          enabled: _isInputEnabled,
                          // onChanged: (String value) => registerController.userAdditionalInfoModel.function = value,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.badge,
                              color: CustomColors.backGroundColor,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: TextEditingController(
                            text: userController.getFullUserInforModel.document3.isEmpty ? 'CNH não informado' : userController.getFullUserInforModel.document3,
                          ),
                          enabled: _isInputEnabled,
                          // onChanged: (String value) => registerController.userAdditionalInfoModel.function = value,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.drive_eta,
                              color: CustomColors.backGroundColor,
                            ),
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
                    onTap: () {
                      _toggleInputEnabled();
                      if (!_isInputEnabled) {
                        print("meu Deus");
                      }
                    },
                    child: MainButton(
                      color: CustomColors.backGroundColor,
                      text: _textButton,
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
