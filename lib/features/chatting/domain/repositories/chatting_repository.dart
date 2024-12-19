import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/chatting/domain/entities/chat_entity.dart';
import 'package:ai_connect/features/chatting/domain/entities/message_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

abstract class ChattingRepository {
  Future<Either<GenerateContentResponse, Failure>> sendGeminiMessage(
      {required MessageEntity msg, List<Content>? history});

  Future<Either<GenerateContentResponse, Failure>> sendChatGptMessage({
    required MessageEntity message,
  });

  Future<Either<ChatEntity, Failure>> saveChatLocally({
    required MessageEntity message,
  });

  Future<Either<ChatEntity, Failure>> updateChatLocally({
    required MessageEntity message,
  });

  Future<Either<List<ChatEntity>, Failure>> fetchAllLocallyChats();

  Future<Either<void, Failure>> deleteChatLocally({
    required int chatId,
  });

  Future<Either<void, Failure>> deleteAllChatLocally();
}
