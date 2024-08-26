import 'package:mobile_create/app/data/models/address_model.dart';
import 'package:mobile_create/app/data/models/user_register_model.dart';
import 'package:mobile_create/app/domain/entities/adress_entity.dart';

abstract class RemoteRepository {
  Future<String> registerUserIdentity(UserIdentityInfoModel userIdentityInfoModel);
  Future<String> registerAdditionalInfo(UserAdditionalInfoModel userAdditionalInfoModel);
  Future<String> registerUserAddress(AddressModel addressModel);
  Future<String> registerAdditionalDocuments(AdditionalDocumentsModel additionalDocumentsModel);
  Future<String> loginUser(String cpf, String password);
  Future<bool> isAuthenticated();
  Future<bool> logOut();
  Future<AddressEntity?> getAddress(String cep);
}
