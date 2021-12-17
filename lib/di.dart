import 'package:charpi/data/repositories/vinland_repository_impl.dart';
import 'package:charpi/domain/repositories/vinland_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:vinland/vinland.dart';

void initDi() {
  final vinland = Vinland(baseUrl: 'baseUrl');
  GetIt.I.registerSingleton<Vinland>(vinland);

  final vinlandRepository = VinlandRepositoryImpl(vinland: GetIt.I());
  GetIt.I.registerSingleton<VinlandRepository>(vinlandRepository);
}
