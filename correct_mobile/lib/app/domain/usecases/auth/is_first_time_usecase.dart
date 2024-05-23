import 'package:mobile_create/app/domain/repositories/local_repository.dart';

class IsFirstTimeUseCase {
  final LocalRepository _localRepository;

  IsFirstTimeUseCase(this._localRepository);

  Future<bool> isFirstTime() async {
    return _localRepository.isFirstTime();
  }
}
