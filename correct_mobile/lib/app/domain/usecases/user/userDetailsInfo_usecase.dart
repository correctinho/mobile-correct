import 'package:mobile_create/app/domain/repositories/remote_repository.dart';

class GetUserDetailsInfoUseCase {
  final RemoteRepository remoteRepository;

  GetUserDetailsInfoUseCase(this.remoteRepository);

  Future<Map<String, dynamic>> getUserDetailsInfo() async {
    return await remoteRepository.getUserDetailsInfo();
  }
}
