import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_second/feature/general/presentation/manger/general_cubit/general_cubit.dart';
import 'package:news_app_second/feature/general/presentation/manger/general_cubit/general_state.dart';
import '../../../../core/utils/widgets/build_list.dart';


class GeneralView extends StatelessWidget {
  const GeneralView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralCubit,GeneralState>(
      builder:(context, state){
        var cubit = GeneralCubit.get(context);
        return BuildList(item: cubit.general,);
      }
    );
     
  }
}





