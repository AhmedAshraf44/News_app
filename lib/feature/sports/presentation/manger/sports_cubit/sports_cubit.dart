

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_second/feature/sports/presentation/manger/sports_cubit/sport_state.dart';

import '../../../../../core/utils/api_service.dart';

class SportsCubit extends Cubit<SportsState>{
  SportsCubit():super(SportsInitialState());

  static SportsCubit get(context) => BlocProvider.of(context);

List sports = [];

   void getSports()
{
  if(sports.isEmpty){

    emit(SportsLoadingState());
  ApiService.getData(url:'v2/top-headlines', query: {
    'country': 'us',
    'category': 'sports',
    'apiKey':'084a387cd5f64a3ea0dc927241196e9d'
  }).then(
    (value) {
      sports = value.data!['articles'];
      emit(SportsSuccessState());
    },
  ).catchError((error) {
    print(error.toString());
    emit(SportsFailureState(errorMeg: error.toString()));
  },);
  }
  else 
  {
    emit(SportsSuccessState());
  }

}

 
}