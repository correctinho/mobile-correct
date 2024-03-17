import 'package:mobile_create/app/domain/entities/show_case_entity.dart';
import 'package:mobile_create/app/domain/usecases/shared/show_case_use_case.dart';

class ItemRepository {
  final ItemUseCase itemUseCase;

  ItemRepository(this.itemUseCase);

  List<ItemEntity> getShowcaseList() {
    return itemUseCase.getShowcaseList();
  }
}
