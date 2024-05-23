import 'package:flutter/material.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/core/regex_extensions.dart';
import 'package:mobile_create/app/presentation/views/auth/login_view.dart';
import 'package:mobile_create/app/presentation/widgets_global/logo_widget.dart';
import 'package:mobile_create/app/presentation/widgets_global/main_button_widget.dart';
import 'package:mobile_create/app/presentation/widgets_global/toast_error_widget.dart';

class CpfEnterView extends StatefulWidget {
  const CpfEnterView({super.key});

  @override
  State<CpfEnterView> createState() => _CpfEnterViewState();
}

class _CpfEnterViewState extends State<CpfEnterView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LogoWidget(height: 240, width: 240),
              const Text(
                'Entre com seu CPF',
                style: TextStyle(
                  color: CustomColors.backGroundColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 8),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val) {
                          if (!val!.isValiCPF) return 'Insira um CPF Valido';
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: CustomColors.backGroundColor,
                              width: 0.3,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: CustomColors.backGroundColor),
                          ),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: CustomColors.backGroundColor,
                          ),
                          hintText: 'CPF',
                          hintStyle: const TextStyle(color: CustomColors.backGroundColor),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          _formKey.currentState!.validate();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ),
                          );
                        },
                        child: const MainButton(
                          color: CustomColors.backGroundColor,
                          text: 'Entre com seu CPF',
                          height: 50,
                          textColor: CustomColors.white,
                          borderRadius: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
