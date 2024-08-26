import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/controllers/auth/first_access_controller.dart';
import 'package:mobile_create/app/presentation/utils/size.dart';
import 'package:mobile_create/app/presentation/views/firs_access/docs_view.dart';
import 'package:mobile_create/app/presentation/views/firs_access/selfie_view.dart';
import 'package:mobile_create/app/presentation/views/firs_access/welcome_view.dart';
import 'package:mobile_create/app/presentation/views/firs_access/widgets/border_button.dart';

class DetailsCheckView extends StatefulWidget {
  const DetailsCheckView({super.key});

  @override
  State<DetailsCheckView> createState() => _DetailsCheckViewState();
}

class _DetailsCheckViewState extends State<DetailsCheckView> {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  height: 450,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        CustomColors.grey.withOpacity(0.4),
                        Colors.white,
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      const Text(
                        'Verificação de Identidade',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 25),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'Antes de começar a usar o app, precisamos checar alguns dados para a sua segurança',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SelfieView(),
                              ),
                            );
                          },
                          leading: const CircleAvatar(
                            backgroundColor: CustomColors.blue,
                            radius: 21,
                            child: Center(
                              child: Text(
                                '1',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          title: const Text('Tire uma selfie'),
                          trailing: const ImageIcon(
                            AssetImage('assets/arrow_foward.png'),
                            color: CustomColors.blue,
                            size: 16,
                          )),
                      Divider(
                        color: CustomColors.colorGradientLinear01.withOpacity(0.2),
                      ),
                      const SizedBox(height: 15),
                      ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const DocsView(),
                              ),
                            );
                          },
                          leading: const CircleAvatar(
                            backgroundColor: CustomColors.blue,
                            radius: 21,
                            child: Center(
                              child: Text(
                                '2',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          title: const Text('Foto do RG (frente e verso)'),
                          trailing: const ImageIcon(
                            AssetImage('assets/arrow_foward.png'),
                            color: CustomColors.blue,
                            size: 16,
                          )),
                      Divider(
                        color: CustomColors.colorGradientLinear01.withOpacity(0.2),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          await firstAccessController.registerAdditionalDocuments();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WelcomeView()));
                        },
                        child: const BorderButon(
                          text: 'Prosseguir',
                          width: 200,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
