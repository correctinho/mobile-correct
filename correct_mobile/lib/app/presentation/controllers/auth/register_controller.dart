import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/data/models/address_model.dart';
import 'package:mobile_create/app/data/models/user_identity_info_model.dart';
import 'package:mobile_create/app/domain/usecases/auth/registerAdditionalInfo_usecase.dart';
import 'package:mobile_create/app/domain/usecases/auth/registerAddress_usecase.dart';
import 'package:mobile_create/app/domain/usecases/auth/register_usecase.dart';
import 'package:mobx/mobx.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  var registerUseCase = GetIt.I.get<RegisterUsecase>();
  var registerAdditional = GetIt.I.get<RegisterAdditionalInfoUseCase>();
  var registerAddress = GetIt.I.get<RegisterAddressUseCase>();

  @observable
  String confirmPass = '';

  @observable
  String response = '';

  @observable
  bool canRegister = false;

  @observable
  bool loading = false;

  @observable
  UserIdentityInfoModel userIdentityInfoModel = UserIdentityInfoModel(
    document: '',
    email: '',
    password: '',
  );

  @action
  Future<void> register() async {
    loading = true;

    try {
      if (confirmPass.isNotEmpty && userIdentityInfoModel.password == confirmPass) {
        response = await registerUseCase.registerUsecase(userIdentityInfoModel);
      }
    } catch (e) {
      //SnackBar(content: Text(response));
      rethrow;
    } finally {
      loading = false;
    }
  }

  @observable
  SetFullUserInforModel userAdditionalInfoModel = SetFullUserInforModel(
    fullname: '',
    phone: '',
    dateOfBirth: '',
    gender: '',
    salary: 0,
    function: '',
    recommendationCode: '',
    maritalStatus: '',
    dependentsQuantity: 0,
    document2: '',
    document3: '',
  );

  @action
  Future<void> registerAdditionalInfo() async {
    try {
      response = await registerAdditional.registerAdditionalInfo(userAdditionalInfoModel);
    } catch (e) {
      rethrow;
    }
  }

  @observable
  AddressModel addressModel = AddressModel(
    zipCode: '',
    street: '',
    neighborhood: '',
    city: '',
    state: '',
  );

  @action
  Future<void> registerUserAddress() async {
    try {
      response = await registerAddress.registerAddress(addressModel);
    } catch (e) {
      rethrow;
    }
  }
}
