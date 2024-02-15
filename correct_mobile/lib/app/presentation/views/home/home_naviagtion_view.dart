import 'package:flutter/material.dart';
import 'package:mobile_create/app/presentation/views/home/qrcode_view.dart';
import 'package:mobile_create/app/presentation/views/home/home_view.dart';
import 'package:mobile_create/app/presentation/views/profile/profile_view.dart';
import 'package:mobile_create/app/presentation/views/shop/shop_home_view.dart';
import 'package:mobile_create/app/presentation/views/wallets/wallets_list_view.dart';

class HomeNavigationView extends StatefulWidget {
  const HomeNavigationView({super.key});

  @override
  State<HomeNavigationView> createState() => _HomeNavigationViewState();
}

class _HomeNavigationViewState extends State<HomeNavigationView> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
            icon: ImageIcon(
              AssetImage('assets/home/home.png'),
            ),
            label: '',
          ),
          NavigationDestination(
              icon: ImageIcon(
                AssetImage('assets/home/profile_home_navigation.png'),
              ),
              label: ''),
          NavigationDestination(
              icon: ImageIcon(
                AssetImage('assets/home/qr-code-outline.png'),
              ),
              label: ''),
          NavigationDestination(
              icon: ImageIcon(
                AssetImage('assets/home/wallet.png'),
              ),
              label: ''),
          NavigationDestination(
            icon: ImageIcon(
              AssetImage('assets/home/kart.png'),
            ),
            label: '',
          ),
        ],
      ),
      body: [
        const HomeView(),
        const ProfileView(),
        const QrCodeView(),
        const WalletsListView(),
        const HomeShopView(),
      ][currentPageIndex],
    );
  }
}
