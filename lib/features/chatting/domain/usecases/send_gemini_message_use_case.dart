import 'package:ai_connect/core/error/api_failure.dart';
import 'package:ai_connect/features/chatting/domain/entities/message_entity.dart';
import 'package:ai_connect/features/chatting/domain/repositories/chatting_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class SendGeminiMessageUseCase {
  final ChattingRepository chattingRepository;
  const SendGeminiMessageUseCase({required this.chattingRepository});

  Future<Either<GenerateContentResponse, Failure>> call({
    required MessageEntity message,
  }) async {
    return await chattingRepository.sendGeminiMessage(message: message);
  }
}
