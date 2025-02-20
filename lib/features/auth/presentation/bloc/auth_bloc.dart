import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/core/helpers/session_helper.dart';
import 'package:firebase_chat/core/injectable/get_it_injector.dart';
import 'package:firebase_chat/features/auth/domain/usecases/auth_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecase usecase;

  AuthBloc({
    required this.usecase,
  }) : super(AuthState.initial()) {
    on<AuthEvent>(mapEventToState);
  }

  Future<void> mapEventToState(AuthEvent event, Emitter<AuthState> emit) {
    return event.map(login: (_Login value) async {
      final response = await usecase.login();

      response.fold((error) {
        emit(state.copyWith(
          errorMessage: error.message,
          status: AuthStatus.error,
        ));
      }, (user) {
        getItInjector.get<SessionHelper>().saveUser(user);
        emit(state.copyWith(
          user: user,
          status: AuthStatus.authenticated,
        ));
      });
    });
  }
}
