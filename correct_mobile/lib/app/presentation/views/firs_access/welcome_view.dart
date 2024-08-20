import 'package:flutter/material.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/utils/size.dart';
import 'package:mobile_create/app/presentation/views/firs_access/privacy_policies_view.dart';
import 'package:mobile_create/app/presentation/widgets_global/logo_widget.dart';
import 'package:mobile_create/app/presentation/widgets_global/main_button_widget.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        children: [
          Container(
            height: getSize(context).height,
            width: getSize(context).width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[
                Color(0xFF002B43),
                Color(0xFF002F48),
                Color(0xFF021E2D),
              ]),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            child: Column(
              children: [
                const Expanded(
                  flex: 1,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Bem-vindo, “Francisco”.',
                        style: TextStyle(color: CustomColors.ligthGrey, fontSize: 24),
                      )),
                ),
                const Expanded(
                  flex: 1,
                  child: Text(
                    'Porem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class ',
                    style: TextStyle(color: CustomColors.ligthGrey, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Expanded(flex: 1, child: LogoWidget(height: 200, width: 200)),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PrivacyPoliciesView())),
                    child: const MainButton(
                      text: 'Continuar',
                      color: CustomColors.whiteBlue,
                      height: 50,
                      textColor: CustomColors.blue,
                      borderRadius: 50,
                      fontSize: 22,
                    )),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
