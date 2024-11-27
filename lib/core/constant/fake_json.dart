import 'package:ai_connect/features/chatting/data/models/message_model.dart';
import 'package:ai_connect/features/chatting/domain/entities/message_entity.dart';

import 'app_assets_manager.dart';

final fakeJson = [
  {
    "id": 1,
    "text": "Hello, World!",
    "filePath": AppAssetsManager.onboardingImg1,
    "rule": "user",
    "sentAt": "2024-11-27T12:34:56.789Z",
    "fileBytes": null
  },
  {
    "id": 2,
    "text": "Second message",
    "filePath": null,
    "rule": "bot",
    "sentAt": "2024-11-27T12:34:56.789Z",
    "fileBytes": null
  },
  {
    "id": 3,
    "text": "Another message",
    "filePath": null,
    "rule": "bot",
    "sentAt": "2024-11-27T12:34:56.789Z",
    "fileBytes": null
  },
  {
    "id": 1,
    "text": "Hello, World!",
    "filePath": AppAssetsManager.onboardingImg1,
    "rule": "user",
    "sentAt": "2024-11-27T12:34:56.789Z",
    "fileBytes": null
  },
  {
    "id": 2,
    "text": "Second message",
    "filePath": null,
    "rule": "bot",
    "sentAt": "2024-11-27T12:34:56.789Z",
    "fileBytes": null
  },
  {
    "id": 3,
    "text": "Another message",
    "filePath": AppAssetsManager.onboardingImg1,
    "rule": "user",
    "sentAt": "2024-11-27T12:34:56.789Z",
    "fileBytes": null
  }
];

final listOfQuestions = <MessageEntity>[];

fillQuestionList() {
  for (var element in fakeJson) {
    listOfQuestions.add(MessageModel.fromJson(element));
  }
}
