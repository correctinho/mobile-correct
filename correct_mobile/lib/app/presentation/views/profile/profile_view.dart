import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/controllers/user/userAddress_controller.dart';
import 'package:mobile_create/app/presentation/controllers/user/user_controller.dart';
import 'package:mobile_create/app/presentation/views/settings/settings_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var userController = GetIt.I.get<UserController>();
  var userAddressController = GetIt.I.get<GetUserAddressController>();
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: const Color(0xFF024C74),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsView(),
                  ),
                );
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            color: const Color(0xFF024C74),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 3,
                ),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        userController.getFullUserInforModel.fullname,
                        style: GoogleFonts.mitr(
                          textStyle: const TextStyle(
                            color: CustomColors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(35),
                  height: size.height * 0.8,
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: CustomColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'contato',
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  color: Color(0xFF012B42),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                border: BorderDirectional(
                                  bottom: BorderSide(
                                    color: Color.fromARGB(255, 150, 150, 150),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.mail,
                                    color: Color(0xFF012B42),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    userController.getFullUserInforModel.email,
                                    style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          150,
                                          150,
                                          150,
                                        ),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                border: BorderDirectional(
                                  bottom: BorderSide(
                                    color: Color.fromARGB(255, 150, 150, 150),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.call, color: Color(0xFF012B42)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    userController.getFullUserInforModel.phone,
                                    style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          150,
                                          150,
                                          150,
                                        ),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Endereço',
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                color: Color(0xFF012B42),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                            Container(
                              padding: const EdgeInsets.all(7),
                              height: 80,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 250, 182),
                                border: Border.all(
                                  color: const Color.fromARGB(
                                    71,
                                    1,
                                    43,
                                    66,
                                  ),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ENDEREÇO CADASTRO',
                                    style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                    )),
                                  ),
                                  Text(
                                    '${userAddressController.addressModel.street}, ${userAddressController.addressModel.number}, ${userAddressController.addressModel.neighborhood} - ${userAddressController.addressModel.state}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ENDEREÇO DE ENTREGA',
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                color: Color(0xFF012B42),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              )),
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    side: MaterialStateBorderSide.resolveWith(
                                      (states) => const BorderSide(
                                        width: 2.0,
                                        color: CustomColors.black,
                                      ),
                                    ),
                                    value: isChecked,
                                    checkColor: CustomColors.black,
                                    activeColor: CustomColors.white,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    }),
                                Text(
                                  'Mesmo endereço de cadastro',
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                    color: Color(0xFF012B42),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.2,
                        width: size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'carteira',
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                color: Color(0xFF012B42),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacementNamed('/home-navigation');
                              },
                              child: Container(
                                padding: const EdgeInsets.only(left: 10),
                                height: 50,
                                width: size.width,
                                color: const Color(0xFFD9D9D9),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.add_circle,
                                      color: Color(0xFF012B42),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Nova forma de pagamento',
                                      style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                        color: Color(0xFF012B42),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      )),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
