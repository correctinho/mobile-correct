import 'package:mobile_create/app/domain/repositories/remote_repository.dart';

class GetUserAddressUseCase {
  final RemoteRepository remoteRepository;

  GetUserAddressUseCase(this.remoteRepository);

  Future<Map<String, dynamic>> getUserAddress() async {
    return await remoteRepository.getUserAddress();
  }
}
