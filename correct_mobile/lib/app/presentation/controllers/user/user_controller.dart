import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/data/models/getFull_userInfor_model.dart';
import 'package:mobile_create/app/domain/usecases/user/updateUserAdditionalInfor_usecase.dart';
import 'package:mobile_create/app/domain/usecases/user/userDetailsInfo_usecase.dart';
import 'package:mobx/mobx.dart';
part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  var getUserDetailsUsecase = GetIt.I.get<GetUserDetailsInfoUseCase>();
  var UpdateUsecase = GetIt.I.get<UpdateUserAdditionalInforUsecase>();

  @observable
  String document = '';

  @observable
  String response = '';

  @observable
  GetFullUserInforModel getFullUserInforModel = GetFullUserInforModel(
    document: '',
    document2: '',
    document3: '',
    fullname: '',
    displayName: '',
    internalCompanyCode: '',
    gender: '',
    email: '',
    dateOfBirth: '',
    phone: '',
    salary: 0,
    companyOwner: false,
    status: '',
    recommendationCode: '',
    function: '',
    maritalStatus: '',
    dependentsQuantity: 0,
  );

  @action
  Future<void> getUserDetails() async {
    try {
      getFullUserInforModel = GetFullUserInforModel.fromJson(await getUserDetailsUsecase.getUserDetailsInfo());
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> updateUserAdditionalInfor(GetFullUserInforModel getFullUserInforModel) async {
    try {
      getFullUserInforModel = GetFullUserInforModel.fromJson(await UpdateUsecase.updateUserAdditionalInfor(getFullUserInforModel));
    } catch (e) {}
  }
}
