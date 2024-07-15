import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/controllers/auth/first_access_controller.dart';
import 'package:mobile_create/app/presentation/utils/size.dart';
import 'package:mobile_create/app/presentation/views/home/home_naviagtion_view.dart';
import 'package:mobile_create/app/presentation/widgets_global/main_button_widget.dart';

class PrivacyPoliciesView extends StatefulWidget {
  const PrivacyPoliciesView({super.key});

  @override
  State<PrivacyPoliciesView> createState() => _PrivacyPoliciesViewState();
}

class _PrivacyPoliciesViewState extends State<PrivacyPoliciesView> {
  var firstAccessController = GetIt.I.get<FirstAccessController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12),
        height: getSize(context).height,
        width: getSize(context).width,
        child: Column(
          children: [
            const Expanded(
                flex: 1,
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Políticas de Privacidade',
                      style: TextStyle(fontSize: 22),
                    ))),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 2,
              child: Text(
                'Porem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class ',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                'Porem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Row(
              children: [
                Observer(builder: (_) {
                  return Checkbox(value: firstAccessController.privacyPolicies, onChanged: (bool? value) => firstAccessController.privacyPolicies = value!);
                }),
                const Text(
                  'Aceitar políticas de Privacidade ',
                  style: TextStyle(fontSize: 18, color: CustomColors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeNavigationView())),
                child: const MainButton(
                  text: 'Começar a usar o aplicativo',
                  color: CustomColors.blue,
                  height: 50,
                  textColor: CustomColors.whiteBlue,
                  borderRadius: 50,
                )),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
