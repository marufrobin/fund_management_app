import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import 'injection_container.dart';
import '../theme/cubit/theme_cubit.dart';

class AppBlocProviderResolver {
  /// [MultiBlocProvider] is a widget that combines multiple [BlocProvider]
  static final List<SingleChildWidget> providers = [
    /// Theme cubit
    BlocProvider(create: (context) => ThemeCubit()),

    /// Auth Bloc
    BlocProvider(create: (context) => sl<AuthBloc>()),
  ];
}
