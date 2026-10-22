import 'package:injectable/injectable.dart';

import 'package:nti_shopping_app/feature/account/data/domain/entities/account_entity.dart';
import 'package:nti_shopping_app/feature/account/data/domain/repo/account_repo_interface.dart';

@injectable
class GetAccountUseCase {
  final AccountRepoInterface repo;

  GetAccountUseCase(this.repo);

  Future<AccountEntity> call() => repo.getAccountData();
}