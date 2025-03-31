import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/data/models/address_model.dart';
import 'package:mobile_create/app/domain/usecases/user/userAddress_use_case.dart';
import 'package:mobx/mobx.dart';
part 'userAddress_controller.g.dart';

class GetUserAddressController = _GetUserAddressControllerBase with _$GetUserAddressController;

abstract class _GetUserAddressControllerBase with Store {
  final getUserAddressUseCase = GetIt.I.get<GetUserAddressUseCase>();

  @observable
  AddressModel addressModel = AddressModel(
    zipCode: '',
    street: '',
    neighborhood: '',
    city: '',
    state: '',
    number: '',
  );

  @action
  Future<void> getUserAddress() async {
    try {
      addressModel = AddressModel.fromJson(await getUserAddressUseCase.getUserAddress());
    } catch (e) {
      rethrow;
    }
  }
}
