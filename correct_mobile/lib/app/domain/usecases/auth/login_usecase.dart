import 'package:mobile_create/app/domain/repositories/remote_repository.dart';

class LoginUseCase {
  final RemoteRepository remoteRepository;

  LoginUseCase(this.remoteRepository);

  Future<String> loginUseCase(String cpf, String password) async {
    return remoteRepository.loginUser(cpf, password);
  }
}
