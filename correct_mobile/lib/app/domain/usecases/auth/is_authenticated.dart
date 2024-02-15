import 'package:mobile_create/app/domain/repositories/remote_repository.dart';

class IsAuthenticatedUseCase {
  final RemoteRepository _remoteRepositoy;

  IsAuthenticatedUseCase(this._remoteRepositoy);

  Future<bool> isAuthenticated() async {
    return await _remoteRepositoy.isAuthenticated();
  }
}
