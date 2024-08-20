import 'package:mobile_create/app/data/models/user_register_model.dart';
import 'package:mobile_create/app/domain/repositories/remote_repository.dart';

class RegisterAdditionalInfoUseCase {
  final RemoteRepository remoteRepository;

  RegisterAdditionalInfoUseCase(this.remoteRepository);

  Future<String> registerAdditionalInfo(UserAdditionalInfoModel userAdditionalInfoModel) async {
    return await remoteRepository.registerAdditionalInfo(userAdditionalInfoModel);
  }
}
