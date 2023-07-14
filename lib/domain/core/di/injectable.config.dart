// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/download/download_bloc.dart' as _i8;
import '../../../application/fast_laugh/fast_laugh_bloc.dart' as _i5;
import '../../../application/search/search_bloc.dart' as _i9;
import '../../../infrastructure/downloads/download_impl.dart' as _i4;
import '../../../infrastructure/search/search_impl.dart' as _i7;
import '../../downloads/download_services.dart' as _i3;
import '../../search/search_services.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.DownloadServices>(() => _i4.DownloadImpl());
    gh.factory<_i5.FastLaughBloc>(
        () => _i5.FastLaughBloc(gh<_i3.DownloadServices>()));
    gh.lazySingleton<_i6.SearchServices>(() => _i7.SearchImpl());
    gh.factory<_i8.DownloadBloc>(
        () => _i8.DownloadBloc(gh<_i3.DownloadServices>()));
    gh.factory<_i9.SearchBloc>(() => _i9.SearchBloc(
          gh<_i3.DownloadServices>(),
          gh<_i6.SearchServices>(),
        ));
    return this;
  }
}
