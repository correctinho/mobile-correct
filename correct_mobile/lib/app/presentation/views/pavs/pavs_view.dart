import 'package:flutter/material.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/widgets_global/main_button_widget.dart';

class PavsView extends StatefulWidget {
  const PavsView({super.key});

  @override
  State<PavsView> createState() => _PavsViewState();
}

class _PavsViewState extends State<PavsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: CustomColors.black,
        ),
        centerTitle: true,
        title: const Text(
          'Tourism',
          style: TextStyle(fontSize: 36, color: CustomColors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      height: 300,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(22),
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Pesquisa',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22),
                              ),
                            ),
                          ),
                          const MainButton(
                              text: 'Ok',
                              color: CustomColors.backGroundColor,
                              height: 40,
                              textColor: CustomColors.ligthGrey)
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(
              Icons.search,
              color: CustomColors.black,
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 5,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 7,
                          child: Container(
                            child: Column(children: [
                              Text('Nome'),
                              Text('Avaliação'),
                              Text('Avaliação'),
                              Text('Avaliação'),
                              Text('Avaliação'),
                              Text('Avaliação'),
                            ],),
                          ),
                        ),
                      ],
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
