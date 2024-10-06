import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_second/feature/science/presentation/manger/science_cubit/science_cubit.dart';
import 'package:news_app_second/feature/science/presentation/manger/science_cubit/science_state.dart';
import '../../../../core/utils/widgets/build_list.dart';

class ScienceView extends StatelessWidget {
  const ScienceView({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<ScienceCubit,ScienceState>(
      builder:(context, state){
        var cubit = ScienceCubit.get(context);
        return BuildList(item: cubit.science,);
      }
         );
    
  }
}