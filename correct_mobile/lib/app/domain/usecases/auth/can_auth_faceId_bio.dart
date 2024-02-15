// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobile_create/app/domain/repositories/local_repository.dart';

class AuthFaceIdBioUsecase {
  LocalRepository localRepository;

  AuthFaceIdBioUsecase(
    this.localRepository,
  );

  Future<bool> authFaceIdBio() {
    return localRepository.authFaceIdBio();
  }
}
