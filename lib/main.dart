import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app_second/bloc_observer.dart';
import 'package:news_app_second/core/utils/api_service.dart';
import 'package:news_app_second/core/utils/cache_helper.dart';
import 'package:news_app_second/feature/home/presentation/manger/home_cubit/home_state.dart';
import 'package:news_app_second/feature/splash/presentation/view/splash_view.dart';

import 'feature/home/presentation/manger/home_cubit/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  ApiService.init();
  await CacheHelper.init();
  bool? isLight = CacheHelper.getBoolan(
    key: 'isLight',
  );
  runApp(
    BlocProvider(
        create: (context) => HomeCubit()..changeAppMode(fromShared: isLight),
        child: const NewsApp()),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);

        return MaterialApp(
          themeMode: cubit.isLight == true ? ThemeMode.light : ThemeMode.dark,
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              titleSpacing: 20,
              backgroundColor: Colors.white,
              elevation: 0,
              titleTextStyle: TextStyle(fontSize: 24),
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              // systemOverlayStyle: SystemUiOverlayStyle(
              //   statusBarColor: Colors.white,
              //  statusBarIconBrightness: Brightness.dark,
              // ),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.deepOrange,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              elevation: 20,
            ),
            textTheme: const TextTheme(
                bodyMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            )),
          ),
          darkTheme: ThemeData(
            primarySwatch: Colors.deepOrange,
            scaffoldBackgroundColor: HexColor('333739'),
            appBarTheme: AppBarTheme(
              titleSpacing: 20,
              backgroundColor: HexColor('333739'),
              elevation: 0,
              titleTextStyle: const TextStyle(fontSize: 24),
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: HexColor('333739'),
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: HexColor('333739'),
              selectedItemColor: Colors.deepOrange,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              elevation: 20,
            ),
            textTheme: const TextTheme(
                bodyMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            )),
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashView(),
        );
      },
    );
  }
}
