import 'package:ai_connect/features/chatting/domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel({
    super.id,
    super.text,
    super.rule,
    super.filePath,
    super.sentAt,
    super.dataBytesPath,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'filePath': filePath,
      'rule': rule,
      'sentAt': sentAt?.millisecondsSinceEpoch,
      'fileBytes': dataBytesPath,
    };
  }

  factory MessageModel.fromJson(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as int,
      text: map['text'] != null ? map['text'] as String : null,
      filePath: map['filePath'] != null ? map['filePath'] as String : null,
      rule: map['rule'] != null ? map['rule'] as String : MsgRules.user.name,
      sentAt: map['sentAt'] != null ? DateTime.tryParse(map['sentAt']) : null,
      dataBytesPath:
          map['dataBytesPath'] != null ? map['dataBytesPath'] as String : null,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          text == other.text &&
          filePath == other.filePath &&
          rule == other.rule &&
          sentAt == other.sentAt &&
          dataBytesPath == other.dataBytesPath;

  @override
  int get hashCode =>
      id.hashCode ^
      text.hashCode ^
      filePath.hashCode ^
      rule.hashCode ^
      sentAt.hashCode ^
      dataBytesPath.hashCode;

  @override
  String toString() {
    return 'MessageEntity{id: $id, text: $text, filePath: $filePath, rule: $rule, sentAt: $sentAt, fileBytes: $dataBytesPath, chat: $chat}';
  }
}
