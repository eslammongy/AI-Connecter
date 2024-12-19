import 'dart:io';

import 'package:ai_connect/features/chatting/domain/entities/chat_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:objectbox/objectbox.dart';

enum MsgRules { user, bot }

@Entity()
class MessageEntity {
  @Id(assignable: true)
  int id;
  final String? text;
  String? rule = MsgRules.user.name;
  // used for indicating that the message has a file part
  final String? filePath;
  // used for indicating that the message has a data part
  final String? dataBytesPath;
  @Property(type: PropertyType.date)
  final DateTime? sentAt;
  @Transient()
  MsgRules get msgRule => MsgRules.values.byName(rule!);
  set msgRule(MsgRules value) => rule = value.name;
  @Transient()
  File? file;
  @Transient()
  Uint8List? dataBytes;

  final chat = ToOne<ChatEntity>();
  MessageEntity({
    this.id = 0,
    this.text,
    this.filePath,
    this.dataBytesPath,
    this.rule,
    this.sentAt,
  });
}

extension MessageEntityExt on MessageEntity {
  bool get isBot => msgRule == MsgRules.bot;
}
