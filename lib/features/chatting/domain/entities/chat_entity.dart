import 'package:ai_connect/features/chatting/domain/entities/question_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ChatEntity {
  @Id(assignable: true)
  int id;
  final String? title;
  @Transient() // This property won't be stored in the ObjectBox database
  final List<QuestionEntity>? questions;

  @Backlink()
  final dbQuestions = ToMany<QuestionEntity>();

  ChatEntity({
    this.id = 1,
    this.title,
    this.questions,
  });
}
