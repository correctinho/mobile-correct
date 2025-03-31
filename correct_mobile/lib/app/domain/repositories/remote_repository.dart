import 'package:mobile_create/app/data/models/address_model.dart';
import 'package:mobile_create/app/data/models/getFull_userInfor_model.dart';
import 'package:mobile_create/app/data/models/getPartnersCategory_model.dart';
import 'package:mobile_create/app/data/models/user_identity_info_model.dart';
import 'package:mobile_create/app/domain/entities/adress_entity.dart';

abstract class RemoteRepository {
  Future<String> registerUserIdentity(UserIdentityInfoModel userIdentityInfoModel);
  Future<String> registerAdditionalInfo(SetFullUserInforModel userAdditionalInfoModel);
  Future<String> registerUserAddress(AddressModel addressModel);
  Future<String> registerAdditionalDocuments(AdditionalDocumentsModel additionalDocumentsModel);
  Future<Map<String, dynamic>> updateUserAdditionalInfor(GetFullUserInforModel getFullUserInforModel);
  Future<Map<String, dynamic>> getUserDetailsInfo();
  Future<Map<String, dynamic>> getOutputAppUserDetails();
  Future<Map<String, dynamic>> getUserAddress();
  Future<List<Map<String, dynamic>>> getPartnersCategory(GetpartnerscategoryModel getPartnerscategoryModel);
  Future<List<Map<String, dynamic>>> getUserBenefits();
  Future<String> loginUser(String cpf, String password);
  Future<bool> isAuthenticated();
  Future<bool> logOut();
  Future<AddressEntity?> getAddress(String cep);
}
