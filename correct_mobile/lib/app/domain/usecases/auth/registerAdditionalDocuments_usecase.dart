import 'package:mobile_create/app/data/models/user_register_model.dart';
import 'package:mobile_create/app/domain/repositories/remote_repository.dart';

class RegisterAdditionalDocumentsUseCase {
  final RemoteRepository remoteRepository;

  RegisterAdditionalDocumentsUseCase(this.remoteRepository);

  Future<String> registerAdditionalDocuments(AdditionalDocumentsModel additionalDocumentsModel) async {
    return await remoteRepository.registerAdditionalDocuments(additionalDocumentsModel);
  }
}
