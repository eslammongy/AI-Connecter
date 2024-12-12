import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/chatting/domain/entities/chat_entity.dart';
import 'package:ai_connect/features/chatting/domain/entities/message_entity.dart';
import 'package:ai_connect/features/chatting/domain/repositories/chatting_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateChatUseCase {
  final ChattingRepository chattingRepository;
  const UpdateChatUseCase({required this.chattingRepository});

  Future<Either<ChatEntity, Failure>> call({
    required MessageEntity message,
  }) async {
    return await chattingRepository.updateChatLocally(message: message);
  }
}
