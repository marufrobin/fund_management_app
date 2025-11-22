import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fund_management_app/core/config/app_bloc_provider_resolver.dart';
import 'package:fund_management_app/core/theme/cubit/theme_cubit.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/config/app_routes.dart';
import 'core/config/injection_container.dart' as di;
import 'core/theme/theme.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/auth_state.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(
        (await getApplicationDocumentsDirectory()).path,
      ),
    );
    await di.init();
  } catch (e) {
    log(e.toString(), name: " Error on main");
  } finally {
    runApp(
      MultiBlocProvider(
        providers: AppBlocProviderResolver.providers,
        child: DevicePreview(
          enabled: false,
          builder: (context) => const RootApp(),
        ),
      ),
    );
  }
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is LogoutSuccess) {
                  AppRoutesConfiguration.appRouter.go(
                    AppRoutesNames.loginScreen,
                  );
                }
              },
              child: MaterialApp.router(
                title: 'Fund Management App',
                theme: AppTheme().lightTheme,
                darkTheme: AppTheme().darkTheme,
                themeMode: themeMode,
                debugShowCheckedModeBanner: false,
                routerConfig: AppRoutesConfiguration.appRouter,
              ),
            );
          },
        );
      },
    );
  }
}
