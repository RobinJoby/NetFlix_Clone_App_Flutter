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

import '../../../application/download/download_bloc.dart' as _i10;
import '../../../application/fast_laugh/fast_laugh_bloc.dart' as _i5;
import '../../../application/home/home_bloc.dart' as _i11;
import '../../../application/newAndHot/new_and_hot_bloc.dart' as _i12;
import '../../../application/search/search_bloc.dart' as _i13;
import '../../../infrastructure/downloads/download_impl.dart' as _i4;
import '../../../infrastructure/newAndHot/new_and_hot_impl.dart' as _i7;
import '../../../infrastructure/search/search_impl.dart' as _i9;
import '../../downloads/download_services.dart' as _i3;
import '../../newAndHot/new_and_hot_services.dart' as _i6;
import '../../search/search_services.dart' as _i8;

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
    gh.lazySingleton<_i6.NewAndHotServices>(() => _i7.NewAndHotImpl());
    gh.lazySingleton<_i8.SearchServices>(() => _i9.SearchImpl());
    gh.factory<_i10.DownloadBloc>(
        () => _i10.DownloadBloc(gh<_i3.DownloadServices>()));
    gh.factory<_i11.HomeBloc>(() => _i11.HomeBloc(gh<_i6.NewAndHotServices>()));
    gh.factory<_i12.NewAndHotBloc>(
        () => _i12.NewAndHotBloc(gh<_i6.NewAndHotServices>()));
    gh.factory<_i13.SearchBloc>(() => _i13.SearchBloc(
          gh<_i3.DownloadServices>(),
          gh<_i8.SearchServices>(),
        ));
    return this;
  }
}
