import 'package:mobile_create/app/data/datasource/remote/remote_data_source.dart';
import 'package:mobile_create/app/data/models/address_model.dart';
import 'package:mobile_create/app/data/models/getFull_userInfor_model.dart';
import 'package:mobile_create/app/data/models/getPartnersCategory_model.dart';
import 'package:mobile_create/app/data/models/user_identity_info_model.dart';
import 'package:mobile_create/app/domain/entities/adress_entity.dart';
import 'package:mobile_create/app/domain/repositories/remote_repository.dart';

class RemoteRepositoyImpl implements RemoteRepository {
  final RemoteDataSource _remoteDataSource;

  RemoteRepositoyImpl(this._remoteDataSource);

  @override
  Future<String> loginUser(String cpf, String password) async {
    return await _remoteDataSource.loginUser(cpf, password);
  }

  @override
  Future<String> registerUserIdentity(UserIdentityInfoModel userIdentityInfoModel) async {
    return await _remoteDataSource.registerUserIdentity(userIdentityInfoModel);
  }

  @override
  Future<String> registerAdditionalInfo(SetFullUserInforModel userAdditionalInfoModel) async {
    return await _remoteDataSource.registerAdditionalInfo(userAdditionalInfoModel);
  }

  @override
  Future<String> registerAdditionalDocuments(AdditionalDocumentsModel additionalDocumentsModel) async {
    return await _remoteDataSource.registerAdditionalDocuments(additionalDocumentsModel);
  }

  @override
  Future<String> registerUserAddress(AddressModel addressModel) async {
    return await _remoteDataSource.registerUserAddress(addressModel);
  }

  @override
  Future<Map<String, dynamic>> getUserDetailsInfo() async {
    return await _remoteDataSource.getUserDetailsInfo();
  }

  @override
  Future<Map<String, dynamic>> getOutputAppUserDetails() async {
    return await _remoteDataSource.getOutputAppUserDetails();
  }

  @override
  Future<Map<String, dynamic>> getUserAddress() async {
    return await _remoteDataSource.getUserAddress();
  }

  @override
  Future<List<Map<String, dynamic>>> getUserBenefits() async {
    return await _remoteDataSource.getUserBenefits();
  }

  @override
  Future<List<Map<String, dynamic>>> getPartnersCategory(GetpartnerscategoryModel getPartnerscategoryModel) async {
    return await _remoteDataSource.getPartnersCategory(getPartnerscategoryModel);
  }

  @override
  Future<Map<String, dynamic>> updateUserAdditionalInfor(GetFullUserInforModel getFullUserInforModel) async {
    return await _remoteDataSource.updateUserAdditionalInfor(getFullUserInforModel);
  }

  @override
  Future<bool> isAuthenticated() async {
    return await _remoteDataSource.isAuthenticated();
  }

  @override
  Future<bool> logOut() async {
    return await _remoteDataSource.logOut();
  }

  @override
  Future<AddressEntity?> getAddress(String cep) async {
    return await _remoteDataSource.getAddress(cep);
  }
}
