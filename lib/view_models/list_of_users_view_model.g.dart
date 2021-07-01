// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_of_users_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsersListViewModelStore on UsersListViewModel, Store {
  final _$articlesListAtom = Atom(name: 'UsersListViewModel.articlesList');

  @override
  List<UserModel>? get articlesList {
    _$articlesListAtom.reportRead();
    return super.articlesList;
  }

  @override
  set articlesList(List<UserModel>? value) {
    _$articlesListAtom.reportWrite(value, super.articlesList, () {
      super.articlesList = value;
    });
  }

  final _$fetchUsersAsyncAction = AsyncAction('UsersListViewModel.fetchUsers');

  @override
  Future<void> fetchUsers() {
    return _$fetchUsersAsyncAction.run(() => super.fetchUsers());
  }

  @override
  String toString() {
    return '''
articlesList: ${articlesList}
    ''';
  }
}
