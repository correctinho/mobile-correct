abstract class LocalRepository {
   // Authenticate with FaceID and Biometric
  Future<bool> canAuthFaceIdBio();
  Future<bool> authFaceIdBio();
  // First Time
  Future<bool> isFirstTime(String token);
  Future<bool> endFirstTime(String token);
}