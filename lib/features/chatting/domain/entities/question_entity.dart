import 'package:ai_connect/features/chatting/domain/entities/answer_entity.dart';
import 'package:ai_connect/features/chatting/domain/entities/chat_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class QuestionEntity {
  @Id(assignable: true)
  int id;
  final String? question;
  final bool hasFile;
  @Transient() // This property won't be stored in the ObjectBox database
  final List<AnswerEntity>? answers;

  @Backlink()
  final data = ToMany<AnswerEntity>();

  final questionData = ToOne<ChatEntity>();

  QuestionEntity({
    this.id = 1,
    this.question,
    this.hasFile = false,
    this.answers,
  });
}
