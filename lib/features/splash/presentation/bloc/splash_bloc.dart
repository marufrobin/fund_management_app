import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_storage_key.dart';
import '../../../../core/storage/app_secure_storage.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppSecureStorage secureStorage;

  SplashBloc({required this.secureStorage}) : super(SplashInitial()) {
    on<SplashStarted>((event, emit) async {
      emit(SplashLoading());
      
      // Simulate a delay for splash screen
      await Future.delayed(const Duration(seconds: 2));
      
      // Check if user is logged in by checking for userId in secure storage
      final userId = await secureStorage.get(key: AppStorageKey.userId);
      final isLoggedIn = userId != null && userId.isNotEmpty;
      
      emit(SplashAuthenticated(isLoggedIn: isLoggedIn));
    });
  }
}
