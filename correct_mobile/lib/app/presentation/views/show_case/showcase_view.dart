import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/data/models/show_case_list_model.dart';
import 'package:mobile_create/app/presentation/views/home/widget/search_show_case_widget.dart';

class ShowCaseView extends StatefulWidget {
  const ShowCaseView({super.key});

  @override
  State<ShowCaseView> createState() => _ShowCaseViewState();
}

class _ShowCaseViewState extends State<ShowCaseView> {
  List<ShowCaseListModel> showCaseList = [
    ShowCaseListModel(text: 'Alimentação', icon: Icons.fastfood_outlined),
    ShowCaseListModel(text: 'Bem-estar', icon: Icons.medication_liquid_outlined),
    ShowCaseListModel(text: 'Combustível', icon: Icons.local_gas_station_outlined),
    ShowCaseListModel(text: 'Conveniências', icon: Icons.local_convenience_store_rounded),
    ShowCaseListModel(text: 'Lazer', icon: Icons.movie_creation_outlined),
    ShowCaseListModel(text: 'brinquedos', icon: Icons.toys_outlined),
    ShowCaseListModel(text: 'Alimentação', icon: Icons.fastfood_outlined),
    ShowCaseListModel(text: 'Bem-estar', icon: Icons.medication_liquid_outlined),
    ShowCaseListModel(text: 'Combustível', icon: Icons.local_gas_station_outlined),
    ShowCaseListModel(text: 'Conveniências', icon: Icons.local_convenience_store_rounded),
    ShowCaseListModel(
      text: 'Lazer',
      icon: Icons.movie_creation_outlined,
    ),
    ShowCaseListModel(text: 'brinquedos', icon: Icons.toys),
  ];

  late BuildContext appContext;

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/food');
        break;
      case 1:
        Navigator.pushNamed(context, '/bem_estar');
        break;
      case 2:
        Navigator.pushNamed(context, '/combustivel');
        break;
      case 3:
        Navigator.pushNamed(context, 'Conveniencia');
        break;
      case 4:
        Navigator.pushNamed(context, '/lazer');
        break;
      case 5:
        Navigator.pushNamed(context, '/brinquedo');
        break;
      default:
        Navigator.pushNamed(context, '/show-case-view');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    appContext = context;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.blue,
        iconTheme: const IconThemeData(color: CustomColors.white),
        title: const SearchShowCaseWidget(),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Todas as Categorias',
              style: GoogleFonts.mitr(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 100,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final item = showCaseList[index];
                  return InkWell(
                    onTap: () {
                      _navigateToPage(index);
                    },
                    child: Column(
                      children: [
                        Icon(
                          item.icon,
                          size: 34,
                          color: CustomColors.blue,
                        ),
                        Text(
                          item.text,
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  );
                },
                itemCount: showCaseList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
