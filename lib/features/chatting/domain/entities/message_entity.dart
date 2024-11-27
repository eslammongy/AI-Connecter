import 'package:ai_connect/features/chatting/domain/entities/chat_entity.dart';
import 'package:objectbox/objectbox.dart';

enum MsgRules { user, bot }

@Entity()
class MessageEntity {
  @Id(assignable: true)
  int id;
  final String? text;
  final String? filePath;
  String? rule = MsgRules.user.name;
  @Property(type: PropertyType.date)
  final DateTime? sentAt;

  // This property won't be stored in the ObjectBox database
  @Transient()
  final Uri? fileBytes;

  // Transient field for the actual enum
  @Transient()
  MsgRules get msgRule => MsgRules.values.byName(rule!);
  set msgRule(MsgRules value) => rule = value.name;
  final ToOne<ChatEntity> chat = ToOne<ChatEntity>();

  MessageEntity({
    this.id = 0,
    this.text,
    this.filePath,
    this.rule,
    this.sentAt,
    this.fileBytes,
  });
}

extension MessageEntityExt on MessageEntity {
  bool get isBot => msgRule == MsgRules.bot;
}
