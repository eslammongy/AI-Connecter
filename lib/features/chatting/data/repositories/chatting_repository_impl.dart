import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/chatting/domain/entities/chat_entity.dart';
import 'package:ai_connect/features/chatting/domain/entities/message_entity.dart';
import 'package:ai_connect/features/chatting/domain/repositories/chatting_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:google_generative_ai/src/api.dart';

class ChattingRepositoryImpl implements ChattingRepository {
  @override
  Future<Either<void, Failure>> deleteAllChatLocally() {
    // TODO: implement deleteAllChatLocally
    throw UnimplementedError();
  }

  @override
  Future<Either<void, Failure>> deleteChatLocally({required int chatId}) {
    // TODO: implement deleteChatLocally
    throw UnimplementedError();
  }

  @override
  Future<Either<List<ChatEntity>, Failure>> fetchAllLocallyChats() {
    // TODO: implement fetchAllLocallyChats
    throw UnimplementedError();
  }

  @override
  Future<Either<ChatEntity, Failure>> saveChatLocally(
      {required MessageEntity message}) {
    // TODO: implement saveChatLocally
    throw UnimplementedError();
  }

  @override
  Future<Either<GenerateContentResponse, Failure>> sendChatGptMessage(
      {required MessageEntity message}) {
    // TODO: implement sendChatGptMessage
    throw UnimplementedError();
  }

  @override
  Future<Either<GenerateContentResponse, Failure>> sendGeminiMessage(
      {required MessageEntity message}) {
    // TODO: implement sendGeminiMessage
    throw UnimplementedError();
  }

  @override
  Future<Either<ChatEntity, Failure>> updateChatLocally(
      {required MessageEntity message}) {
    // TODO: implement updateChatLocally
    throw UnimplementedError();
  }
}
