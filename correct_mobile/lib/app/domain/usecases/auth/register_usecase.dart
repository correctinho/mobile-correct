import 'package:mobile_create/app/data/models/user_identity_info_model.dart';
import 'package:mobile_create/app/domain/repositories/remote_repository.dart';

class RegisterUsecase {
  final RemoteRepository remoteRepository;

  RegisterUsecase(this.remoteRepository);

  Future<String> registerUsecase(UserIdentityInfoModel userIdentityInfoModel) async {
    return await remoteRepository.registerUserIdentity(userIdentityInfoModel);
  }
}
