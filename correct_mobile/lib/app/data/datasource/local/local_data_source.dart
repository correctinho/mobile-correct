abstract class LocalDataSource {
  // Authenticate with FaceID and Biometric
  Future<bool> canAuthFaceIdBio();
  Future<bool> authFaceIdBio();
  // Set first time
  Future<bool> isFirstTime();
  Future<bool> endFirstTime(String token);
}
