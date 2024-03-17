import 'package:flutter/material.dart';
import 'package:mobile_create/app/domain/entities/show_case_entity.dart';
import 'package:mobile_create/app/domain/repositories/show_case_repository.dart';

class ShowcaseViewModel extends ChangeNotifier {
  final ItemRepository itemRepository;

  ShowcaseViewModel({required this.itemRepository});

  void navigateToItem(BuildContext context, int index) {
    Navigator.pushNamed(
      context,
      itemRepository.getShowcaseList()[index].routeName,
    );
  }

  List<ItemEntity> get showcaseList => itemRepository.getShowcaseList();
}
