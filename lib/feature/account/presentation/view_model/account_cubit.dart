import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:nti_shopping_app/feature/account/data/domain/entities/account_entity.dart';
import 'package:nti_shopping_app/feature/account/data/domain/use_case/get_account_use_case.dart';
import 'package:nti_shopping_app/feature/account/data/domain/use_case/update_account_use_case.dart';

import 'account_state.dart';

@injectable
class AccountCubit extends Cubit<AccountState> {
  final GetAccountUseCase getAccountUseCase;
  final UpdateAccountUseCase updateAccountUseCase;

  AccountCubit(this.getAccountUseCase, this.updateAccountUseCase)
      : super(AccountInitial());

  AccountEntity? account;

  Future<void> getAccount() async {
    emit(AccountLoading());
    try {
      account = await getAccountUseCase();
      if (isClosed) return;
      emit(AccountSuccess(account!));
    } catch (e) {
      if (isClosed) return;
      emit(AccountError(e.toString()));
    }
  }

  Future<void> updateAccount({
    required String name,
    required String email,
    required String phone,
    File? image,
  }) async {
    emit(UpdateAccountLoading());
    try {
      await updateAccountUseCase(
        name: name,
        email: email,
        phone: phone,
        image: image,
      );
      if (isClosed) return;
      emit(UpdateAccountSuccess());
      await getAccount();
    } catch (e) {
      if (isClosed) return;
      emit(UpdateAccountError(e.toString()));
    }
  }
}