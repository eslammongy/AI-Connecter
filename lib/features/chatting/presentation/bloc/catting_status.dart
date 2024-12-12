import 'package:equatable/equatable.dart';

enum ChattingStatus {
  initial,
  loading,
  successSending,
  savedSuccess,
  locallyFetch,
  locallyDelete,
  failure
}

class ChattingState extends Equatable {
  final ChattingStatus status;
  final String? errorMsg;
  final dynamic data;

  const ChattingState({
    this.status = ChattingStatus.initial,
    this.errorMsg,
    this.data,
  });

  @override
  List<Object?> get props => [status, errorMsg, data];
}
