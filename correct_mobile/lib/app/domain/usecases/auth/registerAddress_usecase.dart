import 'package:mobile_create/app/data/models/address_model.dart';
import 'package:mobile_create/app/domain/repositories/remote_repository.dart';

class RegisterAddressUseCase {
  final RemoteRepository remoteRepository;

  RegisterAddressUseCase(this.remoteRepository);

  Future<String> registerAddress(AddressModel addressModel) async {
    return await remoteRepository.registerUserAddress(addressModel);
  }
}
