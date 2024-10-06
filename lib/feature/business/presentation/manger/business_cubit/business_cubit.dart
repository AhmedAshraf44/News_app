import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_second/feature/business/presentation/manger/business_cubit/business_state.dart';
import '../../../../../core/utils/api_service.dart';

class BusinessCubit extends Cubit<BusinessState>{
  BusinessCubit():super(BusinessInitialState());

  static BusinessCubit get(context) => BlocProvider.of(context);

List business = [];

void getBusiness()
{
  if(business.isEmpty)
  {
 emit(BusinessLoadingState());
  ApiService.getData(url:'v2/top-headlines', query: {
    'country': 'us',
    'category': 'business',
    'apiKey':'084a387cd5f64a3ea0dc927241196e9d'
  }).then(
    (value) {
      business = value.data!['articles'];
      emit(BusinessSuccessState());
    },
  ).catchError((error) {
    print(error.toString());
    emit(BusinessFailureState(errorMeg: error.toString()));
  },);
  }else
  {
    emit(BusinessSuccessState());
  }
}


 
}