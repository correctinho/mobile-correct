import 'package:mobile_create/app/data/models/getFull_userInfor_model.dart';
import 'package:mobile_create/app/domain/repositories/remote_repository.dart';

class UpdateUserAdditionalInforUsecase {
  final RemoteRepository remoteRepository;

  UpdateUserAdditionalInforUsecase(this.remoteRepository);

  Future<Map<String, dynamic>> updateUserAdditionalInfor(GetFullUserInforModel getFullUserInforModel) async {
    return await remoteRepository.updateUserAdditionalInfor(getFullUserInforModel);
  }
}
