import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_create/app/core/colors/colors.dart';
import 'package:mobile_create/app/presentation/controllers/partners/partners_controller.dart';
import 'package:mobile_create/app/presentation/controllers/store/location_store.dart';

class ShowCaseFoodView extends StatefulWidget {
  const ShowCaseFoodView({super.key});

  @override
  State<ShowCaseFoodView> createState() => _ShowCaseFoodViewState();
}

class _ShowCaseFoodViewState extends State<ShowCaseFoodView> {
  @override
  void initState() {
    super.initState();
    final LocationStore locationStore = GetIt.I.get<LocationStore>();
    locationStore.getCurrentLocation().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final partnersController = GetIt.I.get<PartnersController>();
    final LocationStore locationStore = GetIt.I.get<LocationStore>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 600,
                    width: size.width,
                    child: Column(
                      children: [
                        Text(
                          'Filtrar por:',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              ExpansionTile(
                                title: Text("Ramo de negócio"),
                                children: [
                                  ListTile(
                                    title: Text('Alimentação'),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text("Cartões"),
                                children: [
                                  ListTile(
                                    title: Text("Cartão Correct"),
                                    onTap: () {},
                                  ),
                                  ListTile(
                                    title: Text("Alimentação"),
                                    onTap: () {},
                                  ),
                                  ListTile(
                                    title: Text("Refeição"),
                                    onTap: () {},
                                  ),
                                  ListTile(
                                    title: Text("Combustível"),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.filter_alt),
            tooltip: 'Notificações',
          )
        ],
        backgroundColor: CustomColors.blue,
        iconTheme: const IconThemeData(color: CustomColors.white),
        toolbarHeight: 120,
        centerTitle: true,
        title: TextFormField(
          onChanged: (String value) {
            partnersController.getPartnerscategoryModel.search = value;
          },
          decoration: InputDecoration(
            filled: true,
            hintText: 'Pesquisar',
            fillColor: CustomColors.white,
            hintStyle: const TextStyle(color: CustomColors.grey),
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.search,
                color: CustomColors.black,
              ),
              onPressed: () async {
                await partnersController.getPartnersCategory();
              },
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ),
      ),
      body: FutureBuilder(
        future: partnersController.getPartnersCategory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: partnersController.partnersList.length,
              itemBuilder: (context, index) {
                final partner = partnersController.partnersList[index];

                locationStore.calculateDistanceTo(partner.latitude, partner.longitude);

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomColors.grey),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    height: size.height * 0.3,
                    width: size.width * 0.9,
                    child: Row(
                      children: [
                        Image.asset('assets/png/super_market.png'),
                        const SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                partner.fantasyName,
                                style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                partner.description ?? 'Descrição não informada',
                                style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: CustomColors.blue,
                                  ),
                                  height: 36,
                                  width: size.width * 0.4,
                                  child: const Center(
                                    child: Text(
                                      'ver oferta',
                                      style: TextStyle(color: CustomColors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Observer(
                                builder: (_) {
                                  return Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Colors.red,
                                      ),
                                      Text('${locationStore.distance.toStringAsFixed(2)} km')
                                    ],
                                  );
                                },
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.map,
                                    color: CustomColors.blue,
                                  ),
                                  Text('Abrir em Mapas')
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
