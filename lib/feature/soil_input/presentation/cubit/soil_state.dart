class SoilState {}

class InitialState extends SoilState {}

class SoilLoadingState extends SoilState {}

class SoilSuccessState extends SoilState {
  final String data;

  SoilSuccessState({required this.data});
}

class SoilErrorState extends SoilState {
  final String errorMessage;
  SoilErrorState({required this.errorMessage});
}
