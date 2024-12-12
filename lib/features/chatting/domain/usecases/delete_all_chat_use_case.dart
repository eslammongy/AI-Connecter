import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/chatting/domain/repositories/chatting_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteAllChatUseCase {
  final ChattingRepository chattingRepository;
  const DeleteAllChatUseCase({required this.chattingRepository});

  Future<Either<void, Failure>> call() async {
    return await chattingRepository.deleteAllChatLocally();
  }
}
