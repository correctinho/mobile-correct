import 'package:mobile_create/app/domain/repositories/remote_repository.dart';

class GetOutputAppUserDetailsUseCase {
  final RemoteRepository remoteRepository;

  GetOutputAppUserDetailsUseCase(this.remoteRepository);

  Future<Map<String, dynamic>> getOutputAppUserDetails() async {
    return await remoteRepository.getOutputAppUserDetails();
  }
}
