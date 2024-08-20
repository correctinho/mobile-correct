import 'package:mobile_create/app/data/datasource/remote/remote_data_source.dart';
import 'package:mobile_create/app/data/models/address_model.dart';
import 'package:mobile_create/app/data/models/user_register_model.dart';
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
  Future<String> registerAdditionalInfo(UserAdditionalInfoModel userAdditionalInfoModel) async {
    return await _remoteDataSource.registerAdditionalInfo(userAdditionalInfoModel);
  }

  @override
  Future<String> registerUserAddress(AddressModel addressModel) async {
    return await _remoteDataSource.registerUserAddress(addressModel);
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
