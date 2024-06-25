import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  );
                },
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Login'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
