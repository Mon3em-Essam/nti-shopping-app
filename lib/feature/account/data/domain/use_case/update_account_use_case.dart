import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/feature/account/data/domain/repo/account_repo_interface.dart';

@injectable
class UpdateAccountUseCase {
  final AccountRepoInterface repo;

  UpdateAccountUseCase(this.repo);

  Future<void> call({
    required String name,
    required String email,
    required String phone,
    File? image,
  }) {
    return repo.updateAccountData(
      name: name,
      email: email,
      phone: phone,
      image: image,
    );
  }
}