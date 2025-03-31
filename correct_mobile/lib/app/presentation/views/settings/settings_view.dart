import 'package:flutter/material.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/data/models/settingsList_model.dart';
import 'package:mobile_create/app/presentation/views/profile/editProfile_view.dart';
import 'package:mobile_create/app/presentation/widgets_global/logo_widget.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  List<SettingsListModel> settingsList = [
    SettingsListModel(text: "Conta", icon: Icons.person, iconLeft: Icons.arrow_right),
    SettingsListModel(text: "Aparencia", icon: Icons.sunny, iconLeft: Icons.arrow_right)
  ];

  late BuildContext appContext;

  void _navigate(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EditProfileView()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoWidget(height: 90, width: 90),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(20),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final item = settingsList[index];
              return InkWell(
                onTap: () {
                  _navigate(index);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        item.icon,
                        size: 34,
                        color: CustomColors.blue,
                      ),
                      Text(
                        item.text,
                        style: const TextStyle(fontSize: 16),
                      ),
                      Icon(
                        item.iconLeft,
                        size: 34,
                        color: CustomColors.blue,
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: settingsList.length,
          ),
        ],
      ),
    );
  }
}
