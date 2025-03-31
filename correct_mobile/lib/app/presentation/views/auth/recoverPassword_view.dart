import 'package:flutter/material.dart';
import 'package:mobile_create/app/core/regex_extensions.dart';
import 'package:mobile_create/app/presentation/views/auth/widgets/text_form_field_widget.dart';
import 'package:mobile_create/app/presentation/widgets_global/logo_widget.dart';

import '../../../core/colors/colors.dart';

class RecoverPassWordView extends StatefulWidget {
  const RecoverPassWordView({super.key});

  @override
  State<RecoverPassWordView> createState() => _RecoverPassWordViewState();
}

class _RecoverPassWordViewState extends State<RecoverPassWordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoWidget(height: 90, width: 90),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          children: [
            //  TextFormFieldWidget(
            //       onChanged: (String value) => registerController.userIdentityInfoModel.email = value,
            //       keyboardType: TextInputType.emailAddress,
            //       prefixIcon: const Icon(
            //         Icons.mail,
            //         color: CustomColors.backGroundColor,
            //       ),
            //       hinText: "E-mail",
            //       obscureText: false,
            //       validator: (val) {
            //         if (!val!.isValidEmail) return 'Entre com um E-mail valido';
            //         return null;
            //       }),
          ],
        ),
      ),
    );
  }
}
