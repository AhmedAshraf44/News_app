import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_second/feature/business/presentation/manger/business_cubit/business_cubit.dart';
import 'package:news_app_second/feature/business/presentation/manger/business_cubit/business_state.dart';
import '../../../../core/utils/widgets/build_list.dart';

class BusinessView extends StatelessWidget {
  const BusinessView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessCubit,BusinessState>(
      builder:(context, state){
        var cubit = BusinessCubit.get(context);
        return BuildList(item: cubit.business,);
      }
    );
  }
}