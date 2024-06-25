import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'package:sr_flutter_project/utils/email_validator.dart';
import 'package:sr_flutter_project/utils/password_validator.dart';

part 'form_state.dart';

class FormCubit extends Cubit<FormState> {
  FormCubit() : super(const FormState());

  void onMailChange(String value) {
    final email = Email.dirty(value);

    emit(
      state.copyWith(
        email: email,
        isValidForm: Formz.validate([email, state.password]),
      ),
    );
  }

  void onPasswordChange(String value) {
    final password = Password.dirty(value);

    emit(
      state.copyWith(
        isValidForm: Formz.validate([password, state.email]),
        password: password,
      ),
    );
  }
}
