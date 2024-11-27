import 'package:ai_connect/features/chatting/domain/entities/chat_entity.dart';
import 'package:ai_connect/features/chatting/domain/entities/message_entity.dart';
import 'package:ai_connect/objectbox.g.dart';

class AppBoxDB {
  late final Store store;

  late final Box<MessageEntity> messagesBox;
  late final Box<ChatEntity> chatBox;

  AppBoxDB._create(this.store) {
    messagesBox = Box<MessageEntity>(store);
    chatBox = Box<ChatEntity>(store);
  }

  static Future<AppBoxDB> create() async {
    final store = await openStore();
    return AppBoxDB._create(store);
  }
}
