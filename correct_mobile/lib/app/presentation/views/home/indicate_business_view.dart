import 'package:flutter/material.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/utils/size.dart';
import 'package:mobile_create/app/presentation/views/firs_access/widgets/border_button.dart';

class IndicateBusinessView extends StatefulWidget {
  const IndicateBusinessView({super.key});

  @override
  State<IndicateBusinessView> createState() => _IndicateBusinessViewState();
}

class _IndicateBusinessViewState extends State<IndicateBusinessView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const ImageIcon(
            AssetImage('assets/ep_arrow-right.png'),
            color: CustomColors.blue,
          ),
        ),
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
              Row(
                children: [
                  Image.asset('assets/business.png'),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Para indicar um comércio,',
                        style: TextStyle(fontSize: 20),
                        softWrap: true,
                      ),
                      Text(
                        'preencha o formulário:',
                        style: TextStyle(fontSize: 20),
                        softWrap: true,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nome do estabelecimento',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '(obrigatório)',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                color: CustomColors.grey.withOpacity(0.5),
                child: TextFormField(
                  onChanged: (value) {},
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: CustomColors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: CustomColors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Responsável',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '(opcional)',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                color: CustomColors.grey.withOpacity(0.5),
                child: TextFormField(
                  onChanged: (value) {},
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: CustomColors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Estado',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '(obrigatório)',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                color: CustomColors.grey.withOpacity(0.5),
                child: TextFormField(
                  onChanged: (value) {},
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: CustomColors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: CustomColors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cidade',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '(obrigatório)',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                color: CustomColors.grey.withOpacity(0.5),
                child: TextFormField(
                  onChanged: (value) {},
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: CustomColors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: CustomColors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bairro',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '(obrigatório)',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                color: CustomColors.grey.withOpacity(0.5),
                child: TextFormField(
                  onChanged: (value) {},
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: CustomColors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: CustomColors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Telefone 1',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '(obrigatório)',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                color: CustomColors.grey.withOpacity(0.5),
                child: TextFormField(
                  onChanged: (value) {},
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: CustomColors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: CustomColors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Telefone 2',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '(opcional)',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                color: CustomColors.grey.withOpacity(0.5),
                child: TextFormField(
                  onChanged: (value) {},
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: CustomColors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const BorderButon(
                    text: 'Enviar',
                    width: 200,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
