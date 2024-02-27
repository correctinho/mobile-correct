import 'package:mobile_create/app/domain/entities/ordinary_user_entity.dart';
import 'package:mobile_create/app/domain/repositories/remote_repository.dart';

class RegisterUsecase {
  final RemoteRepository remoteRepository;

  RegisterUsecase(this.remoteRepository);

  Future<String> registerUsecase(
      OrdinaryUserEntity ordinaryUserEntity, String password) async {
    return await remoteRepository.registerUser(ordinaryUserEntity, password);
  }
}
