
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_second/feature/science/presentation/manger/science_cubit/science_state.dart';

import '../../../../../core/utils/api_service.dart';

class ScienceCubit extends Cubit<ScienceState>{
  ScienceCubit():super(ScienceInitialState());

  static ScienceCubit get(context) => BlocProvider.of(context);

List science = [];

  void getScience()
{
  if(science.isEmpty)
  {
   emit(ScienceLoadingState());
  ApiService.getData(url:'v2/top-headlines', query: {
    'country': 'us',
    'category': 'science',
    'apiKey':'084a387cd5f64a3ea0dc927241196e9d'
  }).then(
    (value) {
      science = value.data!['articles'];
      emit(ScienceSuccessState());
    },
  ).catchError((error) {
    print(error.toString());
    emit(ScienceFailureState(errorMeg: error.toString()));
  },);
  }
  else{
    emit(ScienceSuccessState());
  }
 
}

 
}