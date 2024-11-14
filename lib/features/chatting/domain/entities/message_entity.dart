import 'package:objectbox/objectbox.dart';

@Entity()
class MessageEntity {
  
  @Id(assignable: true)
  int id;
  final String? text;
  final bool isAnswer;
  final bool hasImage;
  final String? imgPath;
  final DateTime? dateTime;

  MessageEntity({
    this.id = 1,
    this.text,
    this.isAnswer = false,
    this.hasImage = false,
    this.imgPath,
    this.dateTime,
  });

}