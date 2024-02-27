import 'package:mobile_create/app/domain/entities/adress_entity.dart';
import 'package:mobile_create/app/domain/entities/ordinary_user_entity.dart';

abstract class RemoteRepository {
  Future<String> registerUser(OrdinaryUserEntity ordinaryUserEntity, String password);
  Future<String> loginUser(String cpf, String password);
  Future<bool> isAuthenticated();
  Future<bool> logOut();
  Future<AddressEntity?> getAddress(String cep);
  
  
}
