

abstract class SportsState {}

class SportsInitialState extends SportsState {}


class SportsLoadingState extends SportsState{}

class SportsSuccessState extends SportsState{}

class SportsFailureState extends SportsState{
  final String errorMeg;

 SportsFailureState({required this.errorMeg});
}