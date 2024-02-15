import 'package:flutter/material.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/core/categories_routes_list.dart';
import 'package:mobile_create/app/presentation/views/categories/categories_navigation.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: CustomColors.black,
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 38,
                      color: CustomColors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ListView.separated(
              padding: const EdgeInsets.all(10),
              separatorBuilder: (context, index) => const Divider(
                color: CustomColors.grey,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => categoriesNavigation[index],
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: ShapeDecoration(
                            color: CustomColors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),
                          child:
                              Image.asset('assets/categories/${index + 1}.png'),
                        ),
                        Text(
                          categoriesRoutesList[index],
                          style: const TextStyle(
                              fontSize: 20, color: CustomColors.black),
                        ),
                        Image.asset(
                          'assets/arrow_foward.png',
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
