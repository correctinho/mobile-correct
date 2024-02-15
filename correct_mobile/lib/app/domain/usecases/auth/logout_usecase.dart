import 'package:mobile_create/app/domain/repositories/remote_repository.dart';

class LogoutUseCase {
  final RemoteRepository _remoteRepository;

  LogoutUseCase(this._remoteRepository);
  Future<bool> logout() async {
    return await _remoteRepository.logOut();
  }
}
