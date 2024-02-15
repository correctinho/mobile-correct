import 'package:mobile_create/app/domain/entities/adress_entity.dart';
import 'package:mobile_create/app/domain/repositories/remote_repository.dart';

class GetAddressUsecase {
  final RemoteRepository _remoteRepository;

  GetAddressUsecase(this._remoteRepository);

  Future<AddressEntity?> getAddress(String cep) async {
    return _remoteRepository.getAddress(cep);
  }
}
