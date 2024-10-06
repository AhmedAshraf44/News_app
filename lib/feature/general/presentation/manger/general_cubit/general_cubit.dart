import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_second/feature/general/presentation/manger/general_cubit/general_state.dart';
import '../../../../../core/utils/api_service.dart';

class GeneralCubit extends Cubit<GeneralState>{
  GeneralCubit():super(GeneralInitialState());

  static GeneralCubit get(context) => BlocProvider.of(context);

List general = [];

void getGeneral()
{
  emit(GeneralLoadingState());
  ApiService.getData(url:'v2/top-headlines', query: {
    'country': 'us',
    'category': 'general',
    'apiKey':'084a387cd5f64a3ea0dc927241196e9d'
  }).then(
    (value) {
      general = value.data!['articles'];
      emit(GeneralSuccessState());
    },
  ).catchError((error) {
    print(error.toString());
    emit(GeneralFailureState(errorMeg: error.toString()));
  },);
}

 
}