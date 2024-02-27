import 'package:mobile_create/app/data/datasource/remote/remote_data_source.dart';
import 'package:mobile_create/app/domain/entities/adress_entity.dart';
import 'package:mobile_create/app/domain/entities/ordinary_user_entity.dart';
import 'package:mobile_create/app/domain/repositories/remote_repository.dart';

class RemoteRepositoyImpl implements RemoteRepository {
  final RemoteDataSource _remoteDataSource;

  RemoteRepositoyImpl(this._remoteDataSource);

  @override
  Future<String> loginUser(String cpf, String password) async {
    return await _remoteDataSource.loginUser(cpf, password);
  }

  @override
  Future<String> registerUser(OrdinaryUserEntity ordinaryUserEntity, String password) async {
    return await _remoteDataSource.registerUser(ordinaryUserEntity, password);
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
