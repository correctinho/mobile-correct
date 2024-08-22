import 'package:flutter/material.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/widgets_global/main_button_widget.dart';

class RegistrationResponseWidget extends StatelessWidget {
  final String text;
  final String img;
  final String route;
  final String textButton;
  const RegistrationResponseWidget({
    super.key,
    required this.text,
    required this.img,
    required this.route,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(img),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40.0,
            right: 40,
            left: 40,
            child: InkWell(
              onTap: () {
                Navigator.popAndPushNamed(context, route);
              },
              child: MainButton(
                text: textButton,
                color: CustomColors.ligthBlue,
                height: 54,
                textColor: CustomColors.white,
                borderRadius: 20,
                fontSize: 17,
              ),
            ),
          )
        ],
      ),
    );
  }
}
