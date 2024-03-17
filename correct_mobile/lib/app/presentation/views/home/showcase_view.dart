import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/data/models/show_case_view_model.dart';
import 'package:mobile_create/app/presentation/views/home/widget/search_show_case_widget.dart';
import 'package:provider/provider.dart';

class ShowcaseView extends StatelessWidget {
  const ShowcaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showcaseViewModel = Provider.of<ShowcaseViewModel>(context);

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
                  return InkWell(
                    onTap: () {
                      showcaseViewModel.navigateToItem(context, index);
                    },
                    child: Column(
                      children: [
                        Icon(
                          showcaseViewModel.itemRepository.getShowcaseList()[index].icon,
                          size: 34,
                          color: Colors.blue,
                        ),
                        Text(
                          showcaseViewModel.itemRepository.getShowcaseList()[index].text,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: showcaseViewModel.itemRepository.getShowcaseList().length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
