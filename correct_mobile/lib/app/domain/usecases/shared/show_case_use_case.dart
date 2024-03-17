import 'package:flutter/material.dart';
import 'package:mobile_create/app/domain/entities/show_case_entity.dart';

class ItemUseCase {
  List<ItemEntity> getShowcaseList() {
    return [
      ItemEntity(
        text: 'Alimentação',
        icon: Icons.fastfood,
        routeName: '/alimentacao',
      ),
      ItemEntity(
        text: 'Bem-estar',
        icon: Icons.medication_liquid,
        routeName: '/bem-estar',
      ),
      ItemEntity(
        text: 'Combustível',
        icon: Icons.local_gas_station_outlined,
        routeName: '/combustivel',
      ),
      ItemEntity(
        text: 'Conveniências',
        icon: Icons.local_convenience_store_rounded,
        routeName: '/conveniencia',
      ),
      ItemEntity(
        text: 'Lazer',
        icon: Icons.movie,
        routeName: '/lazer',
      ),
      ItemEntity(
        text: 'brinquedos',
        icon: Icons.toys,
        routeName: '/brinquedos',
      ),
      ItemEntity(
        text: 'Alimentação',
        icon: Icons.fastfood,
        routeName: '/alimentacao',
      ),
      ItemEntity(
        text: 'Bem-estar',
        icon: Icons.medication_liquid,
        routeName: '/bem-estar',
      ),
      ItemEntity(
        text: 'Combustível',
        icon: Icons.local_gas_station_outlined,
        routeName: '/combustivel',
      ),
      ItemEntity(
        text: 'Conveniências',
        icon: Icons.local_convenience_store_rounded,
        routeName: '/conveniencia',
      ),
      ItemEntity(
        text: 'Lazer',
        icon: Icons.movie,
        routeName: '/lazer',
      ),
      ItemEntity(
        text: 'brinquedos',
        icon: Icons.toys,
        routeName: '/brinquedos',
      ),
    ];
  }
}
