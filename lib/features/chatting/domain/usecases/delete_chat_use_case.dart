import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/chatting/domain/repositories/chatting_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteChatUseCase {
  final ChattingRepository chattingRepository;
  const DeleteChatUseCase({required this.chattingRepository});

  Future<Either<void, Failure>> call({
    required int chatId,
  }) async {
    return await chattingRepository.deleteChatLocally(chatId: chatId);
  }
}
