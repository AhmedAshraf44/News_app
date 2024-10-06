abstract class ScienceState {}

class ScienceInitialState extends ScienceState {}


class ScienceLoadingState extends ScienceState{}

class ScienceSuccessState extends ScienceState{}

class ScienceFailureState extends ScienceState{
  final String errorMeg;

 ScienceFailureState({required this.errorMeg});
}