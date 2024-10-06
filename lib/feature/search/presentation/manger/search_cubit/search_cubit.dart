import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_second/feature/search/presentation/manger/search_cubit/search_state.dart';
import '../../../../../core/utils/api_service.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit():super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

List search = [];

 void getSearch({required var valueSearch}) 
{
  emit(SearchLoadingState());
 ApiService.getData(
  url: 'v2/everything', 
 query: {
  'q': '$valueSearch',
  'apiKey' : '084a387cd5f64a3ea0dc927241196e9d'
 }
 ).then((value) {
   search = value.data!['articles'];
   emit(SearchSuccessState());
 },).catchError((error) {
    print(error.toString());
    emit(SearchFailureState(errorMeg: error.toString()));
 },);
}

 
}