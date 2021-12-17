import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_state.freezed.dart';

@freezed
class DataState<T> with _$DataState<T> {
  const factory DataState.loading() = _Loading;
  const factory DataState.error(Object error) = _Error;
  const factory DataState.success(T data) = _Success;
}
