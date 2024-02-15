import 'package:flutter/material.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/core/main_cards_list_mock.dart';
import 'package:mobile_create/app/presentation/widgets_global/main_button_widget.dart';

class TourismView extends StatefulWidget {
  const TourismView({super.key});

  @override
  State<TourismView> createState() => _TourismViewState();
}

class _TourismViewState extends State<TourismView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
        padding: const EdgeInsets.only(left: 12, bottom: 12, top: 12),
        color: CustomColors.backGroundColor,
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Locais Próximos',
                style: TextStyle(
                    fontSize: 25,
                    color: CustomColors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 25,),
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 220,
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 220,
                          width: 330,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/tourism/${index + 1}.png',
                              ),
                              fit: BoxFit.contain
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            mainCardsListMock[index].title,
                            style: const TextStyle(
                                fontSize: 18,
                                color: CustomColors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            mainCardsListMock[index].subtitle,
                            style: const TextStyle(
                                fontSize: 18,
                                color: CustomColors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Categorias',
                style: TextStyle(
                    fontSize: 25,
                    color: CustomColors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
           const SizedBox(
              height: 25,
            ),
            Expanded(
              flex: 2,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 25,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    height: 120,
                    width: 80,
                    child: Column(
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: ShapeDecoration(
                            color: CustomColors.ligthGrey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/tourism/2${index + 1}.png'),
                            ),
                          ),
                        ),
                        Text(
                          smallCardsListMock[index],
                          style: const TextStyle(
                              fontSize: 18,
                              color: CustomColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
