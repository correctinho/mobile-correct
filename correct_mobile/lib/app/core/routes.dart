import 'package:mobile_create/app/presentation/views/home/home_naviagtion_view.dart';
import 'package:mobile_create/app/presentation/views/home/home_view.dart';
import 'package:mobile_create/app/presentation/views/auth/login_or_signup_view.dart';
import 'package:mobile_create/app/presentation/views/auth/login_view.dart';
import 'package:mobile_create/app/presentation/views/auth/register_view.dart';
import 'package:mobile_create/app/presentation/views/auth/splash_view.dart';
import 'package:mobile_create/app/presentation/views/legislation/legislation_view.dart';
import 'package:mobile_create/app/presentation/views/profile/profile_view.dart';
import 'package:mobile_create/app/presentation/views/shop/shop_home_view.dart';
import 'package:mobile_create/app/presentation/views/tourism/tourism_view.dart';
import 'package:mobile_create/app/presentation/views/wallets/wallets_list_view.dart';

var routes = {
  '/splash': (_) => const SplashView(),
  '/login-or-signup': (_) => const LoginOrSignUp(),
  '/login': (_) => const LoginView(),
  '/sign-up': (_) => const RegisterView(),
  '/home-navigation': (_) => const HomeNavigationView(),
  '/home-navigation/home': (_) => const HomeView(),
  '/home-navigation/shop': (_) => const HomeShopView(),
  '/home-navigation/custom-products': (_) => const HomeShopView(),
  '/legislation': (_) => const LegislationView(),
  '/tourism': (_) => const TourismView(),
  '/wallets-list': (_) => const WalletsListView(),
  '/profile': (_) => const ProfileView()
};
