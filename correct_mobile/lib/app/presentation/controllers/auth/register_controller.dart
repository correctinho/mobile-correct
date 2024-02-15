import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/domain/usecases/auth/register_usecase.dart';
import 'package:mobx/mobx.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  var registerUseCase = GetIt.I.get<RegisterUsecase>();

  @observable
  String cpf = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPass = '';

  @observable
  String response = '';

  @observable
  bool canRegister = false;

  @observable
  bool loading = false;

  @action
  Future<void> register() async {
    loading = true;
    if (email.isNotEmpty &&
        cpf.isNotEmpty &&
        confirmPass.isNotEmpty &&
        password == confirmPass) {
      response = await registerUseCase.registerUsecase(cpf, email, password);
      if (response == 'created' && password == confirmPass) {
        canRegister = true;
      }
      loading = false;
    }
  }
}
