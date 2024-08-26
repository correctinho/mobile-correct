import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/controllers/auth/first_access_controller.dart';
import 'package:mobile_create/app/presentation/utils/pick_image.dart';
import 'package:mobile_create/app/presentation/utils/size.dart';
import 'package:mobile_create/app/presentation/views/firs_access/widgets/border_button.dart';

class DocsView extends StatefulWidget {
  const DocsView({super.key});

  @override
  State<DocsView> createState() => _DocsViewState();
}

class _DocsViewState extends State<DocsView> {
  var firstAccessController = GetIt.I.get<FirstAccessController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Image.asset('assets/logo_correct_nome.png'),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        height: getSize(context).height,
        width: getSize(context).width,
        child: Column(
          children: [
            const ListTile(
              leading: CircleAvatar(
                backgroundColor: CustomColors.blue,
                radius: 21,
                child: Center(
                  child: Text(
                    '2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              title: Text('Foto do RG (frente e verso)'),
            ),
            const SizedBox(
              height: 15,
            ),
            Observer(builder: (_) {
              if (firstAccessController.front == null || firstAccessController.back == null) {
                return Image.asset('assets/first_access/selfie.png');
              } else {
                return Container(
                  height: 400,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.memory(firstAccessController.front!),
                      Image.memory(firstAccessController.back!),
                    ],
                  ),
                );
              }
            }),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    firstAccessController.front = await pickImage(ImageSource.camera);
                    await firstAccessController.saveImgToModel();
                  },
                  child: const BorderButon(
                    text: 'Frente',
                    width: 150,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    firstAccessController.back = await pickImage(ImageSource.camera);
                    await firstAccessController.saveImgToModel();
                  },
                  child: const BorderButon(
                    text: 'Verso',
                    width: 150,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const ImageIcon(
                    AssetImage('assets/ep_arrow-right.png'),
                    color: CustomColors.colorGradientLinear01,
                    size: 40,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
