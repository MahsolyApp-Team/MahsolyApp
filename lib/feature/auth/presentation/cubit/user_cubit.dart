import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_plant/feature/auth/data/repo/user_repository.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository repository;

  UserCubit(this.repository) : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    emit(SignInLoading());

    try {
      final result = await repository.signIn(email: email, password: password);

      result.fold(
        (error) {
          emit(SignInFailure(errMessage: error));
        },
        (model) {
          emit(SignInSuccess(message: model.message ?? "Success"));
        },
      );
    } catch (e) {
      emit(SignInFailure(errMessage: e.toString()));
    }
  }

  // =========================
  // SIGN UP
  // =========================
  Future<void> signUp(String name, String email, String password) async {
    emit(SignUpLoading());
    print("START SIGNUP");
    final response = await repository.signUp(
      name: name,
      email: email,
      password: password,
    );
    print("AFTER RESPONSE");
    response.fold(
      (errMessage) => emit(SignUpFailure(errMessage: errMessage)),
      (signUpModel) => emit(SignUpSuccess(message: signUpModel.message)),
    );
  }
}
