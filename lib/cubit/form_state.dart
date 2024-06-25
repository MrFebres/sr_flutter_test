part of 'form_cubit.dart';

class FormState extends Equatable {
  const FormState({
    this.email = const Email.pure(),
    this.isLoading = false,
    this.isValidForm = false,
    this.password = const Password.pure(),
  });

  final Email email;
  final Password password;
  final bool isLoading;
  final bool isValidForm;

  FormState copyWith({
    Email? email,
    Password? password,
    bool? isLoading,
    bool? isValidForm,
  }) =>
      FormState(
        email: email ?? this.email,
        isLoading: isLoading ?? this.isLoading,
        isValidForm: isValidForm ?? this.isValidForm,
        password: password ?? this.password,
      );

  @override
  List<Object?> get props => [
        email,
        isLoading,
        isValidForm,
        password,
      ];
}
