import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/controllers/token/token_controller.dart';
import 'package:mobile_create/app/presentation/utils/size.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TokenView extends StatefulWidget {
  const TokenView({super.key});

  @override
  State<TokenView> createState() => _TokenViewState();
}

class _TokenViewState extends State<TokenView> {
  var tokenController = GetIt.I.get<TokenController>();

  @override
  void initState() {
    tokenController.startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Token Offline'),
      ),
      body: Container(
        width: getSize(context).width,
        padding: const EdgeInsets.all(12),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/logo_correct_nome.png'),
              Observer(builder: (_) {
                return Text(
                  tokenController.token,
                  style: const TextStyle(fontSize: 40, letterSpacing: 10),
                );
              }),
              Observer(builder: (_) {
                return Text(
                  '${tokenController.time.toString()} s',
                  style: const TextStyle(fontSize: 27),
                );
              }),
              const Text('Token válido por 1 minuto',
                  style: TextStyle(fontSize: 20)),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 170,
                  height: 60,
                  decoration: ShapeDecoration(
                    color: CustomColors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Gerar Token',
                      style: TextStyle(
                          color: CustomColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 22),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              )
            ]),
      ),
    );
  }
}
