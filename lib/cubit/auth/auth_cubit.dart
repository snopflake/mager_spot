import 'package:bloc/bloc.dart';
import 'package:mager_spot/data/repositories/auth_repositories.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthRepository _authRepository = AuthRepository();

   void register(String username, String email, String password) async {
    try {
      emit(AuthLoading());

      var response = await _authRepository.registerRepository(username, email, password);

      if (response == true) {
        emit(AuthSuccess());
      } else {
        emit(AuthError("There is an error: response not success"));
      }
    } catch (e) {
      emit(AuthError("There is an error: ${e.toString()}"));
    }
  }

  void login(String username, String password) async {
    try {
      emit(AuthLoading());

      var response = await _authRepository.loginRepository(username, password);

      if (response == true) {
        emit(AuthSuccess());
      } else {
        emit(AuthError("There is an error: response not success"));
      }
    } catch (e) {
      emit(AuthError("There is an error: ${e.toString()}"));
    }
  }

   Future<void> isHasLogin() async {
    try {
      final user = await _authRepository.getUserRepository();

      if (user != null && user.isNotEmpty) {
        emit(Authenticated());
      } else {
        emit(Unauthenticated());
      }
    } catch (error) {
      emit(AuthError("There is an error : ${error.toString()}"));
    }
  }



}