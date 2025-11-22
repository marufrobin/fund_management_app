import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/logout_user.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;
  final LogoutUser logoutUser;

  AuthBloc({
    required this.loginUser,
    required this.logoutUser,
  }) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      final result = await loginUser(LoginParams(
        email: event.email,
        password: event.password,
      ));
      result.fold(
        (failure) => emit(const AuthError(message: 'Login Failed')),
        (user) => emit(AuthAuthenticated(user: user)),
      );
    });

    on<LogoutRequested>((event, emit) async {
      emit(AuthLoading());
      final result = await logoutUser();
      result.fold(
        (failure) => emit(const AuthError(message: 'Logout Failed')),
        (_) => emit(LogoutSuccess()),
      );
    });
  }
}
