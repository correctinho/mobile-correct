import 'package:get_it/get_it.dart';
import 'package:mobile_create/app/data/datasource/local/local_data_source.dart';
import 'package:mobile_create/app/data/datasource/local/local_data_source_impl.dart';
import 'package:mobile_create/app/data/datasource/remote/remote_data_source.dart';
import 'package:mobile_create/app/data/datasource/remote/remote_data_source_impl.dart';
import 'package:mobile_create/app/data/repositories/local_repository_impl.dart';
import 'package:mobile_create/app/data/repositories/remote_repository_impl.dart';
import 'package:mobile_create/app/domain/repositories/local_repository.dart';
import 'package:mobile_create/app/domain/repositories/remote_repository.dart';
import 'package:mobile_create/app/domain/services/locationPermission_service.dart';
import 'package:mobile_create/app/domain/services/location_service.dart';
import 'package:mobile_create/app/domain/usecases/auth/can_auth_faceId_bio.dart';
import 'package:mobile_create/app/domain/usecases/auth/end_first_time_usecase.dart';
import 'package:mobile_create/app/domain/usecases/auth/is_authenticated.dart';
import 'package:mobile_create/app/domain/usecases/auth/is_first_time_usecase.dart';
import 'package:mobile_create/app/domain/usecases/auth/login_usecase.dart';
import 'package:mobile_create/app/domain/usecases/auth/logout_usecase.dart';
import 'package:mobile_create/app/domain/usecases/partners/partners_use_case.dart';
import 'package:mobile_create/app/domain/usecases/user/outputAppUserDetails_use_case.dart';
import 'package:mobile_create/app/domain/usecases/auth/registerAdditionalDocuments_usecase.dart';
import 'package:mobile_create/app/domain/usecases/auth/registerAdditionalInfo_usecase.dart';
import 'package:mobile_create/app/domain/usecases/auth/registerAddress_usecase.dart';
import 'package:mobile_create/app/domain/usecases/auth/register_usecase.dart';
import 'package:mobile_create/app/domain/usecases/user/updateUserAdditionalInfor_usecase.dart';
import 'package:mobile_create/app/domain/usecases/user/userAddress_use_case.dart';
import 'package:mobile_create/app/domain/usecases/user/userBenefits_use_case.dart';
import 'package:mobile_create/app/domain/usecases/user/userDetailsInfo_usecase.dart';
import 'package:mobile_create/app/domain/usecases/shared/get_address_usecase.dart';
import 'package:mobile_create/app/presentation/controllers/auth/auth_controller.dart';
import 'package:mobile_create/app/presentation/controllers/auth/first_access_controller.dart';
import 'package:mobile_create/app/presentation/controllers/auth/register_controller.dart';
import 'package:mobile_create/app/presentation/controllers/home/home_controller.dart';
import 'package:mobile_create/app/presentation/controllers/partners/partners_controller.dart';
import 'package:mobile_create/app/presentation/controllers/store/location_store.dart';
import 'package:mobile_create/app/presentation/controllers/token/token_controller.dart';
import 'package:mobile_create/app/presentation/controllers/user/outputAppUser_controller.dart';
import 'package:mobile_create/app/presentation/controllers/user/userAddress_controller.dart';
import 'package:mobile_create/app/presentation/controllers/user/userBenefits_controller.dart';
import 'package:mobile_create/app/presentation/controllers/user/user_controller.dart';

final GetIt getIt = GetIt.instance;

Future<void> initInjection() async {
  // DataSources
  getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

  // Repositories
  getIt.registerLazySingleton<LocalRepository>(() => LocalRepositoryImpl(getIt()));
  getIt.registerLazySingleton<RemoteRepository>(() => RemoteRepositoyImpl(getIt()));

  // Usecases
  getIt.registerLazySingleton<AuthFaceIdBioUsecase>(() => AuthFaceIdBioUsecase(getIt()));
  getIt.registerLazySingleton<RegisterUsecase>(() => RegisterUsecase(getIt()));
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(getIt()));
  getIt.registerLazySingleton<IsAuthenticatedUseCase>(() => IsAuthenticatedUseCase(getIt()));
  getIt.registerLazySingleton<IsFirstTimeUseCase>(() => IsFirstTimeUseCase(getIt()));
  getIt.registerLazySingleton<EndFirstTimeUseCase>(() => EndFirstTimeUseCase(getIt()));
  getIt.registerLazySingleton<GetAddressUsecase>(() => GetAddressUsecase(getIt()));
  getIt.registerLazySingleton<RegisterAdditionalDocumentsUseCase>(() => RegisterAdditionalDocumentsUseCase(getIt()));
  getIt.registerLazySingleton<RegisterAdditionalInfoUseCase>(() => RegisterAdditionalInfoUseCase(getIt()));
  getIt.registerLazySingleton<RegisterAddressUseCase>(() => RegisterAddressUseCase(getIt()));
  getIt.registerLazySingleton<GetUserDetailsInfoUseCase>(() => GetUserDetailsInfoUseCase(getIt()));
  getIt.registerLazySingleton<GetOutputAppUserDetailsUseCase>(() => GetOutputAppUserDetailsUseCase(getIt()));
  getIt.registerLazySingleton<GetUserAddressUseCase>(() => GetUserAddressUseCase(getIt()));
  getIt.registerLazySingleton<UserBenefitsUseCase>(() => UserBenefitsUseCase(getIt()));
  getIt.registerLazySingleton<UpdateUserAdditionalInforUsecase>(() => UpdateUserAdditionalInforUsecase(getIt()));
  getIt.registerLazySingleton<PartnersUseCase>(() => PartnersUseCase(getIt()));

  // Controllers
  getIt.registerLazySingleton<HomeController>(() => HomeController());
  getIt.registerLazySingleton<AuthController>(() => AuthController());
  getIt.registerLazySingleton<RegisterController>(() => RegisterController());
  getIt.registerLazySingleton<TokenController>(() => TokenController());
  getIt.registerLazySingleton<FirstAccessController>(() => FirstAccessController());
  getIt.registerLazySingleton<UserController>(() => UserController());
  getIt.registerLazySingleton<OutputAppUserDetailsController>(() => OutputAppUserDetailsController());
  getIt.registerLazySingleton<GetUserAddressController>(() => GetUserAddressController());
  getIt.registerLazySingleton<UserBenefitsController>(() => UserBenefitsController());
  getIt.registerLazySingleton<PartnersController>(() => PartnersController());

  // Services
  getIt.registerSingleton<LocationPermissionService>(LocationPermissionService());

  //store
  getIt.registerSingleton<LocationStore>(LocationStore(getIt()));
}
