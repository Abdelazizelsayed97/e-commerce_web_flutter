import 'package:equatable/equatable.dart';

class Async<T> extends Equatable {
  final T? data;
  final String? failureMessage;
  final bool _successWithoutData;
  final bool? _loading;

  const Async._(
    this.data,
    this.failureMessage,
    this._successWithoutData,
    this._loading,
  );

  bool get isLoading => _loading ?? false;

  bool get isSuccess =>
      (_successWithoutData || data != null) && (failureMessage == null);

  bool get isFailure => failureMessage != null;

  bool get isInitial =>
      (data == null) &&
      (failureMessage == null) &&
      (_successWithoutData == false) &&
      (_loading == null);

  const Async.loading() : this._(null, null, false, true);

  const Async.success(T data) : this._(data, null, false, false);

  const Async.successWithoutData() : this._(null, null, true, false);

  const Async.failure(String failure) : this._(null, failure, false, false);

  const Async.initial() : this._(null, null, false, null);

  Async<T> reduce({
    T? newData,
    String? newFailureMessage,
    bool? newSuccessWithoutData,
    bool? newLoading,
  }) {
    return Async._(
      newData ?? this.data,
      newFailureMessage ?? this.failureMessage,
      newSuccessWithoutData ?? this._successWithoutData,
      newLoading ?? this._loading,
    );
  }

  @override
  List<Object?> get props => [
    data,
    failureMessage,
    _successWithoutData,
    _loading,
  ];

  get postEntity => null;
}

class FailureMessage extends Equatable {
  final String message;

  const FailureMessage(this.message);

  @override
  List<Object?> get props => [message];
}
