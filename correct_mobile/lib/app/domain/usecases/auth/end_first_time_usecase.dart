import 'package:mobile_create/app/domain/repositories/local_repository.dart';

class EndFirstTimeUseCase {
  final LocalRepository _localRepository;

  EndFirstTimeUseCase(this._localRepository);

  Future<bool> endFirsTime(String token) async {
    return _localRepository.endFirstTime(token);
  }
}
