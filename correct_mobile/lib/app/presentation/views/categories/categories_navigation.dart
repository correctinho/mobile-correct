import 'package:flutter/material.dart';
import 'package:mobile_create/app/presentation/views/oceanic_route/oceanic_route_view.dart';
import 'package:mobile_create/app/presentation/views/profile/profile_view.dart';
import 'package:mobile_create/app/presentation/views/settings/settings_view.dart';
import 'package:mobile_create/app/presentation/views/wallets/wallets_list_view.dart';

List<Widget> categoriesNavigation = [
  OceanicRouteView(),
  WalletsListView(),
  ProfileView(),
  SettingsView(),
  
];