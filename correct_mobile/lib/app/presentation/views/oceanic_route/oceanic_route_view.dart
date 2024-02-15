import 'package:flutter/material.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/core/oceanic_route_list.dart';
import 'package:mobile_create/app/presentation/views/oceanic_route/oceanic_route_navigation.dart';

class OceanicRouteView extends StatefulWidget {
  const OceanicRouteView({super.key});

  @override
  State<OceanicRouteView> createState() => _OceanicRouteViewState();
}

class _OceanicRouteViewState extends State<OceanicRouteView> {
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
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      child: Image.asset('assets/categories/1.png'),
                    ),
                    const Text(
                      ' Oceanic Route',
                      style: TextStyle(fontSize: 20, color: CustomColors.black),
                    )
                  ],
                ),
              )),
          Expanded(
            flex: 6,
            child: ListView.separated(
              padding: const EdgeInsets.all(10),
              separatorBuilder: (context, index) => const Divider(
                color: CustomColors.grey,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => oceanicNavigation[index]));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          oceanicRouteList[index],
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
