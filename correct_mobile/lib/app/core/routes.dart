import 'package:mobile_create/app/presentation/views/firs_access/address_view.dart';
import 'package:mobile_create/app/presentation/views/firs_access/details_check_view.dart';
import 'package:mobile_create/app/presentation/views/firs_access/user_info__firstPart_view.dart';
import 'package:mobile_create/app/presentation/views/home/home_naviagtion_view.dart';
import 'package:mobile_create/app/presentation/views/home/home_view.dart';
import 'package:mobile_create/app/presentation/views/auth/login_or_signup_view.dart';
import 'package:mobile_create/app/presentation/views/auth/login_view.dart';
import 'package:mobile_create/app/presentation/views/auth/register_view.dart';
import 'package:mobile_create/app/presentation/views/auth/splash_view.dart';
import 'package:mobile_create/app/presentation/views/profile/editProfile_view.dart';
import 'package:mobile_create/app/presentation/views/show_case/show_case_food_view.dart';
import 'package:mobile_create/app/presentation/views/show_case/showcase_view.dart';
import 'package:mobile_create/app/presentation/views/profile/profile_view.dart';
import 'package:mobile_create/app/presentation/views/shop/shop_home_view.dart';
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
  '/wallets-list': (_) => const WalletsListView(),
  '/profile': (_) => const ProfileView(),
  '/show-case-view': (_) => const ShowCaseView(),
  '/food': (_) => const ShowCaseFoodView(),
  '/user-infor-view': (_) => const UserInfoFirstPart(),
  '/details_check': (_) => const DetailsCheckView(),
  '/address': (_) => const AddressView(),
  '/edit_profile': (_) => const EditProfileView(),
};
