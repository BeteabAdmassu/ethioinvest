import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'appwrite_client.dart';
import 'custom_exceptions.dart';

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
    } on AppwriteException catch (e) {
      if (e.code == 409) {
        throw EmailAlreadyInUseException('Email is already in use.');
      } else if (e.code == 400) {
        throw InvalidEmailException('Invalid email address.');
      } else if (e.code == 422) {
        throw WeakPasswordException('Password is too weak.');
      } else {
        throw GenericAuthException('Registration failed. Please try again.');
      }
    } catch (e) {
      throw NetworkException('Network error. Please check your connection.');
    }
  }

  Future<Session?> loginUser(String email, String password) async {
    try {
      final response = await account.createEmailPasswordSession(
        email: email,
        password: password,
      );
      print('User logged in: ${response.toMap()}');
      await _saveSession(response);
      return response;
    } on AppwriteException catch (e) {
      if (e.code == 401) {
        throw InvalidCredentialsException('Invalid email or password.');
      } else {
        throw GenericAuthException('Please try again.');
      }
    } catch (e) {
      throw NetworkException('Please check your connection.');
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
