import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/controllers/auth/first_access_controller.dart';
import 'package:mobile_create/app/presentation/utils/size.dart';
import 'package:mobile_create/app/presentation/views/firs_access/widgets/border_button.dart';
import 'package:mobx/mobx.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  var firstAccessController = GetIt.I.get<FirstAccessController>();

  @override
  void initState() {
    
    reaction((p0) => firstAccessController.addressEntity.zipCode, (p0) {
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
        title: Image.asset('assets/logo_correct_nome.png'),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        height: getSize(context).height,
        width: getSize(context).width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                leading: CircleAvatar(
                  backgroundColor: CustomColors.blue,
                  radius: 21,
                  child: Center(
                    child: Text(
                      '3',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                title: Text('Endereço'),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'CEP',
                style: TextStyle(fontSize: 20),
              ),
              Observer(builder: (_) {
                return Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        color: CustomColors.grey.withOpacity(0.5),
                        child: TextFormField(
                          onChanged: (value) {
                            firstAccessController.addressEntity.zipCode = value;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: CustomColors.grey.withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                  ],
                );
              }),
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
                            borderRadius: BorderRadius.circular(10),
                            color: CustomColors.grey.withOpacity(0.5),
                            child: TextFormField(
                              onChanged: (value) {
                                firstAccessController.addressEntity.street =
                                    value;
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          CustomColors.grey.withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
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
                            borderRadius: BorderRadius.circular(10),
                            color: CustomColors.grey.withOpacity(0.5),
                            child: Observer(builder: (_) {
                              return TextFormField(
                                onChanged: (value) {
                                  firstAccessController.addressEntity.number =
                                      value;
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            CustomColors.grey.withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
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
                            'Bairro',
                            style: TextStyle(fontSize: 20),
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            color: CustomColors.grey.withOpacity(0.5),
                            child: TextFormField(
                              onChanged: (value) {
                                firstAccessController
                                    .addressEntity.neighborhood = value;
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          CustomColors.grey.withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
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
                            borderRadius: BorderRadius.circular(10),
                            color: CustomColors.grey.withOpacity(0.5),
                            child: Observer(builder: (_) {
                              return TextFormField(
                                onChanged: (value) {
                                  firstAccessController.addressEntity.state =
                                      value;
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            CustomColors.grey.withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
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
                            borderRadius: BorderRadius.circular(10),
                            color: CustomColors.grey.withOpacity(0.5),
                            child: TextFormField(
                              onChanged: (value) {
                                firstAccessController.addressEntity.country =
                                    value;
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          CustomColors.grey.withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
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
                    Navigator.of(context).pop();
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
