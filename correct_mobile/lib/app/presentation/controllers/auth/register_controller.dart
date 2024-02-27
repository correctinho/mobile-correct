import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/domain/entities/ordinary_user_entity.dart';
import 'package:mobile_create/app/domain/usecases/auth/register_usecase.dart';
import 'package:mobx/mobx.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  var registerUseCase = GetIt.I.get<RegisterUsecase>();

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

  @observable
  OrdinaryUserEntity ordinaryUserEntity = OrdinaryUserEntity(
      document: '',
      email: '',
      document2: '',
      document3: '',
      fullName: '',
      gender: '',
      dateOfBirth: '',
      phone: '',
      salary: '',
      function: '',
      recomendationCode: '',
      maritalStatus: '',
      dependentsQuantity: 0,
      line1: '',
      line2: '',
      line3: '',
      postalCode: '',
      neighborhood: '',
      city: '',
      state: '',
      country: '',
      selfieBase64: '',
      documentFrontBase64: '',
      documentBackBase64: '',
      documentSelfieBase64: '');

  @action
  Future<void> register() async {
    loading = true;
    if (confirmPass.isNotEmpty && password == confirmPass) {
      response =
          await registerUseCase.registerUsecase(ordinaryUserEntity, password);
      if (response == 'created' && password == confirmPass) {
        canRegister = true;
      }
      loading = false;
    }
  }
}
