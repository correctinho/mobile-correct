import 'dart:typed_data';

import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/domain/entities/adress_entity.dart';
import 'package:mobile_create/app/domain/usecases/shared/get_address_usecase.dart';
import 'package:mobx/mobx.dart';
part 'first_access_controller.g.dart';

class FirstAccessController = _FirstAccessControllerBase
    with _$FirstAccessController;

abstract class _FirstAccessControllerBase with Store {
  var getCepUseCase = GetIt.I.get<GetAddressUsecase>();

  @observable
  bool privacyPolicies = false;

  @observable
  String cep = '';

  @observable
  String street = '';

  @observable
  String neighborhood = '';

  @observable
  String state = '';

  @observable
  Uint8List? image;

  @observable
  Uint8List? front;

  @observable
  Uint8List? back;

  @observable
  AddressEntity addressEntity = AddressEntity(
    zipCode: '',
    street: '',
    neighborhood: '',
    city: '',
    state: '',
    number: '',
    complement: '',
  );

  @action
  Future<void> getCep() async {
    if (addressEntity.zipCode.length >= 8) {
      final adress = await getCepUseCase.getAddress(cep);
      if (adress != null) {
        addressEntity = adress;

        street = addressEntity.street;
        neighborhood = addressEntity.neighborhood;
        state = addressEntity.state;
        print(street);
        print(neighborhood);
        print(state);
      }
    }
  }
}
