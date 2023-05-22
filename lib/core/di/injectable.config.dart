// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../application/course/course_bloc.dart' as _i9;
import '../../application/initialiize/initilize_bloc.dart' as _i7;
import '../../application/Login/login_bloc.dart' as _i8;
import '../../domain/course/i_course_repo.dart' as _i5;
import '../../domain/force_update/i_help_center_repo.dart' as _i3;
import '../../infrastructure/course/course_repository.dart' as _i6;
import '../../infrastructure/force_update/force_update_repositroy.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.IForceUpdateRepos>(() => _i4.RemoteConfigRepository());
  gh.lazySingleton<_i5.IGetCourse>(() => _i6.CourseRepository());
  gh.factory<_i7.InitilizeBloc>(() => _i7.InitilizeBloc());
  gh.factory<_i8.LoginBloc>(() => _i8.LoginBloc());
  gh.factory<_i9.CourseBloc>(() => _i9.CourseBloc(get<_i5.IGetCourse>()));
  return get;
}
