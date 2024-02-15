import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/core/shop_list_mock.dart';
import 'package:mobile_create/app/presentation/views/shop/kart_view.dart';
import 'package:mobile_create/app/presentation/views/shop/past_purchases_view.dart';
import 'package:mobile_create/app/presentation/views/shop/product_view.dart';
import 'package:mobile_create/app/presentation/views/shop/widgets/main_cards_widget.dart';
import 'package:mobile_create/app/presentation/views/shop/widgets/search_bar_widget.dart';
import 'package:mobile_create/app/presentation/views/shop/widgets/small_cards_widget.dart';

class HomeShopView extends StatefulWidget {
  // final List<ProcutModel> products;
  const HomeShopView({super.key});

  @override
  State<HomeShopView> createState() => _HomeShopViewState();
}

class _HomeShopViewState extends State<HomeShopView> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: CustomColors.blue,
            title: const Text('Carrinho', style: TextStyle(color: Colors.white),),
            leading: Image.asset('assets/ep_arrow-right.png'),
            centerTitle: true,
            elevation: 0,
            bottom: const TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 1,
              tabs: [
                Tab(
                  text: 'Carrinho Atual',
                ),
                Tab(text: 'Compras Passadas'),
              ],
            ),
          ),
          body: const Padding(
            padding: EdgeInsets.all(12),
            child: TabBarView(children: [KartView(), PastPurchasesView()]),
          )),
    );
  }
}
