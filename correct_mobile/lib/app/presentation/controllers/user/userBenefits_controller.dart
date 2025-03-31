import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/data/models/userBenefits_model.dart';
import 'package:mobile_create/app/domain/usecases/user/userBenefits_use_case.dart';
import 'package:mobx/mobx.dart';
part 'userBenefits_controller.g.dart';

class UserBenefitsController = _UserBenefitsControllerBase with _$UserBenefitsController;

abstract class _UserBenefitsControllerBase with Store {
  final userBenefitsUseCase = GetIt.I.get<UserBenefitsUseCase>();

  @observable
  ObservableList<UserBenefitsModel> userBenefitsList = ObservableList<UserBenefitsModel>();

  @action
  Future<void> getUserBenefits() async {
    try {
      final response = await userBenefitsUseCase.getUserBenefits();
      userBenefitsList = ObservableList.of(
        response.map((json) => UserBenefitsModel.fromJson(json)).toList(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
