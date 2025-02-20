part of 'auth_bloc.dart';


@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    String? errorMessage,
    User? user,
    required AuthStatus status,
  }) = _AuthState;

  factory AuthState.initial() => const _AuthState(
    status: AuthStatus.initial,
  );
}


enum AuthStatus {
  initial,
  loading,
  authenticated,
  error,
}