import 'package:ai_connect/features/chatting/domain/entities/answer_entity.dart';
import 'package:ai_connect/features/chatting/domain/entities/chat_entity.dart';
import 'package:ai_connect/features/chatting/domain/entities/question_entity.dart';
import 'package:ai_connect/objectbox.g.dart';

class AppBoxDB {
  late final Store store;

  late final Box<AnswerEntity> answersBox;
  late final Box<QuestionEntity> questionsBox;
  late final Box<ChatEntity> chatBox;

  AppBoxDB._create(this.store) {
    answersBox = Box<AnswerEntity>(store);
    questionsBox = Box<QuestionEntity>(store);
    chatBox = Box<ChatEntity>(store);
  }

  static Future<AppBoxDB> create() async {
    final store = await openStore();
    return AppBoxDB._create(store);
  }
}
