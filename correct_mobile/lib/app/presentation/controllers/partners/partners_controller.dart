import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:mobile_create/app/data/models/getPartnersCategory_model.dart';
import 'package:mobile_create/app/domain/usecases/partners/partners_use_case.dart';
part 'partners_controller.g.dart';

class PartnersController = _PartnersControllerBase with _$PartnersController;

abstract class _PartnersControllerBase with Store {
  final partnersUseCase = GetIt.I.get<PartnersUseCase>();

  @observable
  GetpartnerscategoryModel getPartnerscategoryModel = GetpartnerscategoryModel(
    search: '',
    partnerCategory: '',
    page: 1,
    city: '',
    offerProduct: false,
    businessInfoUuid: '',
    fantasyName: '',
    latitude: 0,
    longitude: 0,
    address: AddressPartners(
      city: '',
      neighborhood: '',
      line2: '',
      state: '',
      line1: '',
      uuid: '',
      postalCode: '',
      country: '',
    ),
    card: '',
  );

  @observable
  ObservableList<GetpartnerscategoryModel> partnersList = ObservableList<GetpartnerscategoryModel>();

  @action
  Future<void> getPartnersCategory() async {
    try {
      final response = await partnersUseCase.getPartnersCategory(getPartnerscategoryModel);
      final List<GetpartnerscategoryModel> partners = response.map((item) => GetpartnerscategoryModel.fromJson(item)).toList();
      partnersList = ObservableList.of(partners);
    } catch (e) {
      rethrow;
    }
  }
}
