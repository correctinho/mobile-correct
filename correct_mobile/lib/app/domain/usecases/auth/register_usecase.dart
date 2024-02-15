import 'package:mobile_create/app/domain/repositories/remote_repository.dart';

class RegisterUsecase {
  final RemoteRepository remoteRepository;

  RegisterUsecase(this.remoteRepository);

  Future<String> registerUsecase(
      String cpf, String email, String password) async {
    return await remoteRepository.registerUser(cpf, email, password);
  }
}
