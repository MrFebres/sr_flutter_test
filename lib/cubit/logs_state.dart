part of 'logs_cubit.dart';

class LogsState extends Equatable {
  const LogsState({
    this.isLoading = false,
    this.records = const [],
  });

  final bool isLoading;
  final List<Record> records;

  LogsState copyWith({
    bool? isLoading,
    List<Record>? records,
  }) =>
      LogsState(
        isLoading: isLoading ?? this.isLoading,
        records: records ?? this.records,
      );

  @override
  List<Object> get props => [
        isLoading,
        records,
      ];
}
