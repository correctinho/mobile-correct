// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobile_create/app/data/datasource/local/local_data_source.dart';
import 'package:mobile_create/app/domain/repositories/local_repository.dart';

class LocalRepositoryImpl implements LocalRepository {
  final LocalDataSource localDataSource;

  LocalRepositoryImpl(
    this.localDataSource,
  );

  @override
  Future<bool> authFaceIdBio() async => await localDataSource.authFaceIdBio();

  @override
  Future<bool> canAuthFaceIdBio() async =>
      await localDataSource.canAuthFaceIdBio();

  @override
  Future<bool> isFirstTime(String token) async {
    return localDataSource.isFirstTime(token);
  }

  @override
  Future<bool> endFirstTime(String token) async {
    return localDataSource.endFirstTime(token);
  }
}
