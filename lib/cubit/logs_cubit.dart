import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sr_flutter_project/domain/entities/record_entity.dart';

import 'database_cubit.dart';

part 'logs_state.dart';

class LogsCubit extends Cubit<LogsState> {
  LogsCubit(this.dbCubit) : super(const LogsState());

  final DatabaseCubit dbCubit;

  Future<void> getAllRecords() async {
    if (dbCubit.database == null) return;

    emit(state.copyWith(isLoading: true));

    try {
      List<Map<String, Object?>> data =
          await dbCubit.database!.query(dbCubit.userTableName);

      List<Record> records = [];
      for (var item in data) {
        records.add(
          Record(
            date: item['date'] as String,
            id: item['id'] as int,
            username: item['username'] as String,
          ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
