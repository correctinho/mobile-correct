import 'package:mobile_create/app/domain/entities/adress_entity.dart';
import 'package:mobile_create/app/domain/entities/ordinary_user_entity.dart';

abstract class RemoteDataSource {
  // Authenticate with email and password
  Future<String> registerUser(OrdinaryUserEntity ordinaryUserEntity, String password);
  Future<String> loginUser(String cpf, String password);
  Future<bool> isAuthenticated();
  Future<bool> logOut();
  // Address
  Future<AddressEntity?> getAddress(String cep);
}
