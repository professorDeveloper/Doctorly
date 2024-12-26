import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../core/api/auth_api_impl.dart';
import '../../core/di/get_it.dart';
import '../../core/models/requests/auth/login_request.dart';
import '../../core/models/responses/auth/login_response.dart';
import '../../utils/response.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthApiImpl authApi = serviceLocator<AuthApiImpl>();

  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());

      try {
        // Use your AuthApiImpl for login logic
        final response = await authApi.login(
            loginRequest:
                LoginRequest(phone: event.phone, password: event.password));

        if (response is Success) {
          var data = response.data as LoginResponse;
          emit(LoginSuccess(sucsess: data));
        } else if (response is Error) {
          emit(LoginFailure(error: response.errorMessage));
        }
      } catch (error) {
        // Handle other types of exceptions, e.g., network errors
        emit(LoginFailure(error: error.toString()));
      }
    });
  }
}
