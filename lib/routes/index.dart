import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:sr_flutter_project/cubit/form_cubit.dart';
import 'package:sr_flutter_project/screens/home.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return BlocProvider(
          create: (BuildContext context) {
            return FormCubit();
          },
          child: const HomeScreen(),
        );
      },
    ),
  ],
);
