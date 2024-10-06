abstract class BusinessState {}

class BusinessInitialState extends BusinessState {}


class BusinessLoadingState extends BusinessState{}

class BusinessSuccessState extends BusinessState{}

class BusinessFailureState extends BusinessState{
  final String errorMeg;

 BusinessFailureState({required this.errorMeg});
}