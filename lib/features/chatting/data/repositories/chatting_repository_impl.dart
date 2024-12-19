import 'dart:io';

import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/chatting/domain/entities/chat_entity.dart';
import 'package:ai_connect/features/chatting/domain/entities/message_entity.dart';
import 'package:ai_connect/features/chatting/domain/repositories/chatting_repository.dart';
import 'package:ai_connect/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

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
      {required MessageEntity msg, List<Content>? history}) async {
    final geminiSession = geminiModel.startChat(history: history);
    final content = Content(msg.msgRule.name, [TextPart(msg.text ?? "")]);
    try {
      if (msg.filePath != null) {
        final uriFile = File(msg.filePath!).uri;
        content.parts.add(FilePart(uriFile));
      }
      if (msg.dataBytesPath != null) {
        final byteData = await File(msg.filePath!).readAsBytes();
        content.parts.add(DataPart("image/png", byteData));
      }
      final response = await geminiSession.sendMessage(content);
      return left(response);
    } catch (exp) {
      return right(ConnectionFailure(message: exp.toString()));
    }
  }

  @override
  Future<Either<ChatEntity, Failure>> updateChatLocally(
      {required MessageEntity message}) {
    // TODO: implement updateChatLocally
    throw UnimplementedError();
  }
}
