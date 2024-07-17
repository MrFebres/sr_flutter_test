import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sr_flutter_project/cubit/logs_cubit.dart';
import 'package:sr_flutter_project/domain/entities/record_entity.dart';

class LogsScreen extends StatelessWidget {
  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        if (details.delta.dx > 0) {
          context.pop();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Número único consecutivo',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Usuario',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Hora / fecha',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                Expanded(
                  child: BlocBuilder<LogsCubit, LogsState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Column(
                          children: [
                            CircularProgressIndicator(),
                          ],
                        );
                      }

                      if (state.records.isEmpty) {
                        return const Text('No hay registros guardados');
                      }

                      return ListView.builder(
                        itemCount: state.records.length,
                        itemBuilder: (context, index) {
                          final Record record = state.records[index];

                          return ListTile(
                            leading: Text('${record.id}'),
                            title: Text(record.username),
                            trailing: Text(record.date),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
