import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/controllers/auth/first_access_controller.dart';
import 'package:mobile_create/app/presentation/utils/size.dart';
import 'package:mobile_create/app/presentation/views/firs_access/details_check_view.dart';
import 'package:mobile_create/app/presentation/views/firs_access/widgets/border_button.dart';
import 'package:mobile_create/app/presentation/widgets_global/logo_widget.dart';
import 'package:mobile_create/app/presentation/widgets_global/toast_error_widget.dart';
import 'package:mobx/mobx.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  var firstAccessController = GetIt.I.get<FirstAccessController>();
  bool _idEditing = false;

  @override
  void initState() {
    reaction((p0) => firstAccessController.cep, (p0) {
      firstAccessController.getCep();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const LogoWidget(
          height: 100,
          width: 100,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        height: getSize(context).height,
        width: getSize(context).width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Endereço',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'CEP',
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Material(
                      child: TextFormField(
                        validator: (value) {
                          if (value == "" || value == null) return "Por favor informe seu CEP";
                          return null;
                        },
                        onChanged: (value) {
                          firstAccessController.cep = value;
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: CustomColors.backGroundColor),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Observer(builder: (_) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Rua',
                            style: TextStyle(fontSize: 20),
                          ),
                          Material(
                            child: TextFormField(
                              validator: (value) {
                                if (value == "" || value == null) return "Por favor informe sua rua";
                                return null;
                              },
                              controller: TextEditingController(text: firstAccessController.street),
                              textAlign: TextAlign.center,
                              enabled: false,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: CustomColors.backGroundColor),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'N°',
                          style: TextStyle(fontSize: 20),
                        ),
                        Material(
                          child: Observer(builder: (_) {
                            return TextFormField(
                              onChanged: (value) {
                                firstAccessController.addressEntity.number = value;
                                firstAccessController.addressModel = firstAccessController.addressModel.copyWith(number: value);
                              },
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: CustomColors.backGroundColor),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Observer(builder: (_) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Bairro',
                            style: TextStyle(fontSize: 20),
                          ),
                          Material(
                            child: TextFormField(
                              validator: (value) {
                                if (value == "" || value == null) return "Por favor informe seu";
                                return null;
                              },
                              controller: TextEditingController(text: firstAccessController.neighborhood),
                              textAlign: TextAlign.center,
                              enabled: false,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: CustomColors.backGroundColor),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Estado',
                            style: TextStyle(fontSize: 20),
                          ),
                          Material(
                            child: Observer(builder: (_) {
                              return TextFormField(
                                enabled: false,
                                controller: TextEditingController(text: firstAccessController.state),
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(color: CustomColors.backGroundColor),
                                ),
                              );
                            }),
                          ),
                        ],
                      )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Observer(builder: (_) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'País',
                            style: TextStyle(fontSize: 20),
                          ),
                          Material(
                            child: TextFormField(
                              enabled: false,
                              controller: TextEditingController(text: firstAccessController.addressEntity.country),
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: CustomColors.backGroundColor),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(flex: 1, child: Container())
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () async {
                    await firstAccessController.registerUserAddress();
                    if (firstAccessController.response == 'created') {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DetailsCheckView()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const ToastErrorWidget(messageError: "Erro ao cadastrar endereço! Tente Novamente").build(context) as SnackBar,
                      );
                    }
                  },
                  child: const BorderButon(
                    text: 'Salvar',
                    width: 200,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const ImageIcon(
                    AssetImage('assets/ep_arrow-right.png'),
                    color: CustomColors.colorGradientLinear01,
                    size: 40,
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
