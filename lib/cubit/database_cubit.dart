import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

part 'database_state.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(InitDatabaseState());

  Database? database;
  final String databaseName = 'logs.db';
  final String userTableName = 'User';

  Future<void> initDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, databaseName);

    if (await Directory(dirname(path)).exists()) {
      database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
            'CREATE TABLE $userTableName (id INTEGER PRIMARY KEY, username TEXT, date TEXT)',
          );
          debugPrint('[DB CREATED]');
        },
      );

      emit(LoadDatabaseState());
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);

        database = await openDatabase(
          path,
          version: 1,
          onCreate: (Database db, int version) async {
            await db.execute(
              'CREATE TABLE $userTableName (id INTEGER PRIMARY KEY, username TEXT, date TEXT)',
            );
            debugPrint('[DB CREATED]');
          },
        );
        emit(LoadDatabaseState());
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
