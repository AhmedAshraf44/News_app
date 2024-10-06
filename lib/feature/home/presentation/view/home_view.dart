import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_second/feature/business/presentation/manger/business_cubit/business_cubit.dart';
import 'package:news_app_second/feature/general/presentation/manger/general_cubit/general_cubit.dart';
import 'package:news_app_second/feature/home/presentation/manger/home_cubit/home_cubit.dart';
import 'package:news_app_second/feature/home/presentation/manger/home_cubit/home_state.dart';
import 'package:news_app_second/feature/science/presentation/manger/science_cubit/science_cubit.dart';
import 'package:news_app_second/feature/sports/presentation/manger/sports_cubit/sports_cubit.dart';

import '../../../../core/utils/widgets/custom_title.dart';
import '../../../search/presentation/view/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GeneralCubit()..getGeneral(),),
        BlocProvider(create: (context) => BusinessCubit()..getBusiness()),
        BlocProvider(create: (context) => SportsCubit()..getSports()),
        BlocProvider(create: (context) => ScienceCubit()..getScience()),
      ],
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
             // backgroundColor: Colors.white,
              //elevation: 0,
              title:  CustomTitle(cubit: cubit),
              actions: [
                IconButton(icon:const Icon(Icons.search),onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const SearchView(),));
                },),
                IconButton(icon:const Icon(Icons.brightness_4_outlined),onPressed: () {
                  cubit.changeAppMode();
                },),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.items,
              currentIndex: cubit.currentIndex,
              onTap: (value) {
                cubit.changeIndex(value);
              },
            ),
            body: cubit.pages[cubit.currentIndex],
          );
        },
      ),
    );
  }
}

