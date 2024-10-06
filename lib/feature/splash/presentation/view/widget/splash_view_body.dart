import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../core/utils/widgets/custom_title.dart';
import '../../../../home/presentation/manger/home_cubit/home_cubit.dart';
import '../../../../home/presentation/manger/home_cubit/home_state.dart';
import '../../../../home/presentation/view/home_view.dart';


class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HomeCubit,HomeState>(builder: (context, state) {
              var cubit = HomeCubit.get(context);
    return AnimatedSplashScreen(
      splashTransition: SplashTransition.scaleTransition,
      splashIconSize: 200,
      backgroundColor:cubit.isLight== true?   Colors.white : HexColor('333739'),
      splash:     CustomTitle(cubit: cubit,mainAxisAlignment: MainAxisAlignment.center,),
      nextScreen: const HomeView(),
     );} );
  }
}

