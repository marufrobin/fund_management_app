import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String email, String password) async {
    // Mocking a successful login
    await Future.delayed(const Duration(seconds: 2));

    // Simulate login for any user
    return UserModel(
      id: 'user_123',
      email: email,
      name: 'Test User',
      token: 'mock_token_${DateTime.now().millisecondsSinceEpoch}',
    );
  }
}
