import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/data/models/output_appUser_details_model.dart';
import 'package:mobile_create/app/domain/usecases/user/outputAppUserDetails_use_case.dart';
import 'package:mobx/mobx.dart';
part 'outputAppUser_controller.g.dart';

class OutputAppUserDetailsController = _OutputAppUserDetailsControllerBase with _$OutputAppUserDetailsController;

abstract class _OutputAppUserDetailsControllerBase with Store {
  final getOutputAppUserDetailsUseCase = GetIt.I.get<GetOutputAppUserDetailsUseCase>();

  @observable
  OutputAppUserDetailsModel outputAppUserDetailsModel = OutputAppUserDetailsModel(
    status: false,
    userInfo: false,
    userAddress: false,
    userValidation: false,
  );

  @action
  Future<void> getOutputAppUserDetails() async {
    try {
      outputAppUserDetailsModel = OutputAppUserDetailsModel.fromJson(await getOutputAppUserDetailsUseCase.getOutputAppUserDetails());
    } catch (e) {
      rethrow;
    }
  }
}
