// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/datasourses/auth_datasource.dart' as _i419;
import '../../features/auth/data/datasourses/auth_datasource_iml.dart' as _i221;
import '../../features/auth/data/repository/auth_repository.dart' as _i104;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i436;
import '../../features/auth/domain/usecases/auth_usecase_iml.dart' as _i431;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/chat/domain/usecases/chat_usecase.dart' as _i569;
import '../../features/chat/domain/usecases/chat_usecase_iml.dart' as _i366;
import '../../features/chat/presentation/bloc/chat_bloc.dart' as _i65;
import '../helpers/session_helper.dart' as _i802;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i802.SessionHelper>(() => _i802.SessionHelper());
    gh.factory<_i419.AuthDatasource>(() => _i221.AuthDatasourceIml());
    gh.factory<_i569.ChatUsecase>(() => _i366.ChatUsecaseIml());
    gh.factory<_i65.ChatBloc>(
        () => _i65.ChatBloc(usecase: gh<_i569.ChatUsecase>()));
    gh.factory<_i961.AuthRepository>(
        () => _i104.AuthRepositoryIml(datasource: gh<_i419.AuthDatasource>()));
    gh.factory<_i436.AuthUsecase>(
        () => _i431.AuthUsecaseIml(repository: gh<_i961.AuthRepository>()));
    gh.factory<_i797.AuthBloc>(
        () => _i797.AuthBloc(usecase: gh<_i436.AuthUsecase>()));
    return this;
  }
}
