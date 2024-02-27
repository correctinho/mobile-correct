import 'package:flutter/material.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/domain/entities/adress_entity.dart';
import 'package:mobile_create/app/presentation/widgets_global/main_button_widget.dart';

class LegislationView extends StatefulWidget {
  const LegislationView({super.key});

  @override
  State<LegislationView> createState() => _LegislationViewState();
}

class _LegislationViewState extends State<LegislationView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    List<AddressEntity> legislationList = [
     
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: CustomColors.black,
        ),
        centerTitle: true,
        title: const Text(
          'Legislation',
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
                  });
            },
            icon: const Icon(
              Icons.search,
              color: CustomColors.black,
            ),
          )
        ],
      ),
      body: Container(
        color: CustomColors.backGroundColor,
        height: size.height,
        width: size.width,
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => Divider(),
          itemCount: 3,
          itemBuilder: (context, index) => Row(
            children: [
              Icon(Icons.pedal_bike),
              Column(
                children: [
                  Text(legislationList[index].street),
                  Text(legislationList[index].state),
                ],
                
              ),
              Text(legislationList[index].number!)
            ],
          )        // GridView.builder(
        //   padding: const EdgeInsets.all(20),
        //   itemCount: 10,
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2,
        //       mainAxisSpacing: 30,
        //       crossAxisSpacing: 15,
        //       childAspectRatio: 1 / 0.5),
        //   itemBuilder: (context, index) {
        //     return InkWell(
        //       onTap: () {},
        //       child: Container(
        //         padding: const EdgeInsets.all(12),
        //         height: 50,
        //         decoration: ShapeDecoration(
        //           color: CustomColors.ligthGrey,
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(15),
        //           ),
        //         ),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             Image.asset('assets/legislation/${index + 1}.png'),
        //             Text(' ${legislationList[index]}')
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // ),
      ),
    ));
  }
}
