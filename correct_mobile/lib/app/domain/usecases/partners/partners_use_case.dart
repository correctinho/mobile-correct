import 'package:mobile_create/app/data/models/getPartnersCategory_model.dart';
import 'package:mobile_create/app/domain/repositories/remote_repository.dart';

class PartnersUseCase {
  final RemoteRepository remoteRepository;

  PartnersUseCase(this.remoteRepository);

  Future<List<Map<String, dynamic>>> getPartnersCategory(GetpartnerscategoryModel getPartnerscategoryModel) async {
    return await remoteRepository.getPartnersCategory(getPartnerscategoryModel);
  }
}
