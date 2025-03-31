import 'package:flutter/material.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/utils/size.dart';

class HelpView extends StatefulWidget {
  const HelpView({super.key});

  @override
  State<HelpView> createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const ImageIcon(
            AssetImage('assets/ep_arrow-right.png'),
            color: CustomColors.blue,
          ),
        ),
        title: Image.asset('assets/logo_correct_nome.png'),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        height: getSize(context).height,
        width: getSize(context).width,
        child: const SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  ImageIcon(
                    AssetImage(
                      'assets/home/help.png',
                    ),
                    color: CustomColors.blue,
                  ),
                  Text(
                    '  Ajuda',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                'Porem ipsum dolor sit amet? \n\nKonsectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class ',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 15),
              Text(
                'Porem ipsum dolor sit amet? \n\nKonsectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class ',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 15),
              Text(
                'Porem ipsum dolor sit amet? \n\nKonsectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class ',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
