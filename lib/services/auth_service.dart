import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'appwrite_client.dart';

class AuthService {
  final Account account = Account(AppwriteClient.client);

  Future<void> registerUser(String email, String password, String name) async {
    try {
      final response = await account.create(
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

  Future<Session?> loginUser(String email, String password) async {
    try {
      // Create a new session
      final response = await account.createEmailPasswordSession(
        email: email,
        password: password,
      );
      print('User logged in: ${response.toMap()}');
      await _saveSession(response);
      return response;
    } catch (e) {
      print('Error logging in: $e');
      return null;
    }
  }

  Future<void> logoutUser() async {
    try {
      final sessionId = await getSessionId();
      if (sessionId != null) {
        await account.deleteSession(sessionId: sessionId);
      }
      await _clearSession();
      print('User logged out');
    } catch (e) {
      print('Error logging out: $e');
    }
  }

  Future<void> _saveSession(Session session) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('sessionId', session.$id);
    await prefs.setString('userId', session.userId);
  }

  Future<void> _clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('sessionId');
    await prefs.remove('userId');
  }

  Future<String?> getSessionId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('sessionId');
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

}
