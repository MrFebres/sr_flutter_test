import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sr_flutter_project/cubit/database_cubit.dart';
import 'package:sr_flutter_project/cubit/form_cubit.dart';
import 'package:sr_flutter_project/cubit/logs_cubit.dart';
import 'package:sr_flutter_project/screens/home.dart';
import 'package:sr_flutter_project/screens/logs.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return BlocProvider(
          create: (context) {
            final dbCubit = context.read<DatabaseCubit>();

            return FormCubit(dbCubit);
          },
          lazy: false,
          child: const HomeScreen(),
        );
      },
    ),
    GoRoute(
      path: '/logs',
      builder: (context, state) {
        return BlocProvider(
          create: (context) {
            final dbCubit = context.read<DatabaseCubit>();

            return LogsCubit(dbCubit)..getAllRecords();
          },
          lazy: false,
          child: const LogsScreen(),
        );
      },
    ),
  ],
);
