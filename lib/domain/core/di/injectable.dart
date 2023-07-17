import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone_app/domain/core/di/injectable.config.dart';
import 'package:netflix_clone_app/infrastructure/downloads/download_impl.dart';
import 'package:netflix_clone_app/infrastructure/newAndHot/new_and_hot_impl.dart';
import 'package:netflix_clone_app/infrastructure/search/search_impl.dart';

final getIt = GetIt.instance;

@InjectableInit(
  preferRelativeImports: true,
  initializerName: 'init',
  asExtension: true,
)
Future<void> configureInjectable() async {
  getIt.registerLazySingleton<DownloadImpl>(() => DownloadImpl());
  getIt.registerLazySingleton<SearchImpl>(() => SearchImpl());
  getIt.registerLazySingleton<NewAndHotImpl>(() => NewAndHotImpl());
  getIt.init();
}
