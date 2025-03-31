import 'package:mobile_create/app/domain/repositories/remote_repository.dart';

class UserBenefitsUseCase {
  final RemoteRepository remoteRepository;

  UserBenefitsUseCase(this.remoteRepository);

  Future<List<Map<String, dynamic>>> getUserBenefits() async {
    return await remoteRepository.getUserBenefits();
  }
}
