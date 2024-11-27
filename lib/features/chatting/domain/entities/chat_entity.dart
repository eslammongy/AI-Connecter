import 'package:ai_connect/features/chatting/domain/entities/message_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ChatEntity {
  @Id(assignable: true)
  int id;
  @Transient() // This property won't be stored in the ObjectBox database
  final List<MessageEntity>? messages;

  @Backlink()
  final history = ToMany<MessageEntity>();

  ChatEntity({
    this.id = 1,
    this.messages,
  });
}
