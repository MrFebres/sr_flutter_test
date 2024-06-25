import 'package:formz/formz.dart';

enum PasswordValidationError { invalid }

class LoginPassword extends FormzInput<String, PasswordValidationError> {
  const LoginPassword.pure() : super.pure('');

  const LoginPassword.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String? value) {
    return value != null && value.isNotEmpty
        ? null
        : PasswordValidationError.invalid;
  }
}
