import 'package:flutter/material.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/data/models/settingsList_model.dart';
import 'package:mobile_create/app/presentation/views/profile/editAdditionalInfors_view.dart';
import 'package:mobile_create/app/presentation/widgets_global/logo_widget.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  List<SettingsListModel> settingsList = [
    SettingsListModel(text: "Informações pessoais", icon: Icons.person, iconLeft: Icons.arrow_right),
    SettingsListModel(text: "Senha", icon: Icons.lock, iconLeft: Icons.arrow_right),
    SettingsListModel(text: "E-mail", icon: Icons.email, iconLeft: Icons.arrow_right)
  ];

  late BuildContext appContext;

  void _navigate(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EditAdditioinalInforsView()));
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EditProfileView()));
      case 2:
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
