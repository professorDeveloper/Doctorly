import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../core/api/auth_api_impl.dart';
import '../../core/di/get_it.dart';
import '../../core/models/requests/auth/register_request.dart';
import '../../core/models/responses/auth/register_response.dart';
import '../../utils/response.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthApiImpl authApi = serviceLocator<AuthApiImpl>();

  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterLoading());
      try {
        final response = await authApi.register(
            registerRequest: RegisterRequest(
                fullName: event.fullName,
                gender: event.gender,
                phone: event.phone,
                password: event.password,
                password2: event.password2));
        if (response is Success) {
          final registerRes=RegisterResponse.fromJson(response.data);
          emit(RegisterSuccess(response: registerRes));
          print(registerRes.user!.fullName.toString()+"asdasd");
        } else if (response is Error) {
          emit(RegisterFailure(error: response.errorMessage.toString()));
        }
      } catch (e) {
        emit(RegisterFailure(error: e.toString()));
      }
    });
  }
}
