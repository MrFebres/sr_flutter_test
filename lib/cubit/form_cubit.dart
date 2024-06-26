import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:sr_flutter_project/cubit/database_cubit.dart';
import 'package:sr_flutter_project/utils/email_validator.dart';
import 'package:sr_flutter_project/utils/password_validator.dart';

part 'form_state.dart';

class FormCubit extends Cubit<FormState> {
  FormCubit(this.dbCubit) : super(const FormState());

  final DatabaseCubit dbCubit;
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void onMailChange(String value) {
    final email = Email.dirty(value);

    if (value != mailController.text) mailController.text = value;

    emit(
      state.copyWith(
        email: email,
        isValidForm: Formz.validate([email, state.password]),
      ),
    );
  }

  void onPasswordChange(String value) {
    final password = Password.dirty(value);

    if (value != passwordController.text) passwordController.text = value;

    emit(
      state.copyWith(
        isValidForm: Formz.validate([password, state.email]),
        password: password,
      ),
    );
  }

  Future<bool> onFormSubmit() async {
    if (dbCubit.database == null) return false;

    emit(state.copyWith(isLoading: true));

    try {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy/MM/dd hh:mm');
      final String date = formatter.format(now);

      dbCubit.database!.insert(dbCubit.userTableName, {
        'username': state.email.value,
        'date': date,
      });

      mailController.text = '';
      passwordController.text = '';
      emit(const FormState());
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
