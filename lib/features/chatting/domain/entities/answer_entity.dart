import 'package:ai_connect/features/chatting/domain/entities/question_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class AnswerEntity {
  int id = 0;
  final String? text;
  final bool isAnswer;
  final bool hasFile;
  final String? filePath;
  @Property(type: PropertyType.date)
  final DateTime? dateTime;

  final answer = ToOne<QuestionEntity>();
  AnswerEntity({
    this.text,
    this.isAnswer = false,
    this.hasFile = false,
    this.filePath,
    this.dateTime,
  });
}
