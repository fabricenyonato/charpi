import 'package:charpi/domain/entities/user.dart';
import 'package:charpi/domain/repositories/vinland_repository.dart';

class LoginUseCase {
  final VinlandRepository repository;

  LoginUseCase({ required this.repository });

  Future<User> call(String identifier, String password) =>
    repository.login(identifier, password);
}
