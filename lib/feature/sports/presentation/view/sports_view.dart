import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_second/feature/sports/presentation/manger/sports_cubit/sport_state.dart';
import 'package:news_app_second/feature/sports/presentation/manger/sports_cubit/sports_cubit.dart';
import '../../../../core/utils/widgets/build_list.dart';

class SportsView extends StatelessWidget {
  const SportsView({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<SportsCubit,SportsState>(
      builder:(context, state){
        var cubit = SportsCubit.get(context);
        return BuildList(item: cubit.sports,);
      }
         );
  }
}

