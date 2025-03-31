import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/domain/usecases/auth/can_auth_faceId_bio.dart';
import 'package:mobile_create/app/domain/usecases/auth/end_first_time_usecase.dart';
import 'package:mobile_create/app/domain/usecases/auth/is_first_time_usecase.dart';
import 'package:mobile_create/app/domain/usecases/auth/login_usecase.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  var loginUseCase = GetIt.I.get<LoginUseCase>();
  var authFaceIdBioUsecase = GetIt.instance.get<AuthFaceIdBioUsecase>();
  var isFirstTimeUseCase = GetIt.instance.get<IsFirstTimeUseCase>();
  var endFirstTimeUseCase = GetIt.instance.get<EndFirstTimeUseCase>();

  @observable
  bool isFirst = true;

  @observable
  String cpf = '';

  @observable
  String password = '';

  @observable
  String email = '';

  @observable
  String response = '';

  @observable
  bool faceId = false;

  @observable
  bool loading = false;

  @action
  Future<void> login() async {
    loading = true;
    response = await loginUseCase.loginUseCase(cpf, password);
    loading = false;
  }

  @action
  authFaceIdBio() async {
    faceId = await authFaceIdBioUsecase.authFaceIdBio();
  }

  @action
  Future isFirstTime() async {
    isFirst = await isFirstTimeUseCase.isFirstTime();
  }

  @action
  Future endFirstTime(String token) async {
    await endFirstTimeUseCase.endFirsTime(token);
  }
}
