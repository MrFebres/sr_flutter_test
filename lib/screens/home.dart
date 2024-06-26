import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sr_flutter_project/cubit/form_cubit.dart' as cubit;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formCubit = context.read<cubit.FormCubit>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Hint and Label TextField',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BlocBuilder<cubit.FormCubit, cubit.FormState>(
                builder: (BuildContext context, cubit.FormState state) {
                  return TextField(
                    controller: formCubit.mailController,
                    decoration: InputDecoration(
                      errorText: !state.email.isPure && !state.email.isValid
                          ? 'Please enter a valid mail.'
                          : null,
                      hintText: 'Enter your email',
                      label: const Text('Username'),
                      prefixIcon: const Icon(Icons.people),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: formCubit.onMailChange,
                    textInputAction: TextInputAction.next,
                  );
                },
              ),
              const SizedBox(height: 8.0),
              BlocBuilder<cubit.FormCubit, cubit.FormState>(
                builder: (BuildContext context, cubit.FormState state) {
                  return TextField(
                    controller: formCubit.passwordController,
                    decoration: InputDecoration(
                      errorText:
                          !state.password.isPure && !state.password.isValid
                              ? "Please don't leave this field empty."
                              : null,
                      hintText: 'Password',
                      label: const Text('Password'),
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    keyboardType: TextInputType.streetAddress,
                    onChanged: formCubit.onPasswordChange,
                    onSubmitted: state.isValidForm && !state.isLoading
                        ? (_) async {
                            final success = await formCubit.onFormSubmit();

                            if (!context.mounted) return;

                            if (success) {
                              context.push('/logs');
                            }
                          }
                        : null,
                  );
                },
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: BlocBuilder<cubit.FormCubit, cubit.FormState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state.isValidForm && !state.isLoading
                          ? () async {
                              final success = await formCubit.onFormSubmit();

                              if (!context.mounted) return;

                              if (success) {
                                context.push('/logs');
                              }
                            }
                          : null,
                      child: const Text('Login'),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8.0),
              TextButton(
                onPressed: () {
                  context.push('/logs');
                },
                child: const Text('Logs de acceso'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
