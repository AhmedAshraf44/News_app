import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_second/core/utils/cache_helper.dart';
import 'package:news_app_second/feature/business/presentation/view/business_view.dart';
import 'package:news_app_second/feature/general/presentation/view/general_view.dart';
import 'package:news_app_second/feature/home/presentation/manger/home_cubit/home_state.dart';
import 'package:news_app_second/feature/science/presentation/view/science_view.dart';
import 'package:news_app_second/feature/sports/presentation/view/sports_view.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(HomeInitialState());

static HomeCubit get(context) => BlocProvider.of(context);

List<BottomNavigationBarItem> items = const[
  BottomNavigationBarItem(icon: Icon(Icons.generating_tokens), label: 'General',),
  BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
  BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
  BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),

];
List pages = const
[
  GeneralView(),
  BusinessView(),
  SportsView(),
  ScienceView(),
];

int currentIndex= 0;
bool isLight = true ;

void changeIndex(int index) {
  currentIndex = index;
  emit(HomeChangeIndexState());
}

void changeAppMode({bool? fromShared})async{
  if(fromShared != null)
  {
    isLight = fromShared ;
  }
  else
  {
    isLight = !isLight ;
  }

  
CacheHelper.putBoolan(key: 'isLight', value: isLight);
  if(isLight == true)
  {
       emit(LightState());
  }
  else 
  {
      emit(DarkState());
  }

}


}
