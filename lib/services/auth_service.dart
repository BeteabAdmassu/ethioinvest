import 'package:appwrite/appwrite.dart';
import 'appwrite_client.dart';

class AuthService {
  Future<void> registerUser(String email, String password, String name) async {
    try {
      final response = await AppwriteClient.account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );
      print('User registered: ${response.toMap()}');
    } catch (e) {
      print('Error registering user: $e');
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      final response = await AppwriteClient.account.createEmailPasswordSession(
        email: email,
        password: password,
      );
      print('User logged in: ${response.toMap()}');
    } catch (e) {
      print('Error logging in: $e');
    }
  }
}
