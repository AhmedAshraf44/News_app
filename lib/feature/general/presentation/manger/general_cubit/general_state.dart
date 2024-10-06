
abstract class GeneralState {}

class GeneralInitialState extends GeneralState {}

class GeneralLoadingState extends GeneralState{}

class GeneralSuccessState extends GeneralState{}

class GeneralFailureState extends GeneralState{
  final String errorMeg;

 GeneralFailureState({required this.errorMeg});
}