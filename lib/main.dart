import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sr_flutter_project/cubit/database_cubit.dart';
import 'package:sr_flutter_project/routes/index.dart';

void main() async {
  runApp(
    BlocProvider(
      create: (_) => DatabaseCubit()..initDatabase(),
      lazy: false,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      title: 'Flutter Demo',
    );
  }
}
