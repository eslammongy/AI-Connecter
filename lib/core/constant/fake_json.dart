import 'package:ai_connect/core/constant/app_assets_manager.dart';
import 'package:ai_connect/features/chatting/data/models/message_model.dart';
import 'package:ai_connect/features/chatting/domain/entities/message_entity.dart';

final fakeJson = [
  {
    "id": 1,
    "text": "Hello, how can I help?",
    "isAnswer": true,
    "hasImage": false,
    "imgPath": null,
    "dateTime": "2024-11-14T12:34:56.789Z"
  },
  {
    "id": 2,
    "text": "I need assistance with my account.",
    "isAnswer": false,
    "hasImage": false,
    "imgPath": null,
    "dateTime": "2024-11-14T12:35:01.123Z"
  },
  {
    "id": 3,
    "text": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    "isAnswer": false,
    "hasImage": true,
    "imgPath": AppAssetsManager.onboardingImg1,
    "dateTime": "2024-11-14T12:35:10.456Z"
  },
  {
    "id": 1,
    "text": "Hello, how can I help?",
    "isAnswer": true,
    "hasImage": false,
    "imgPath": null,
    "dateTime": "2024-11-14T12:34:56.789Z"
  },
  {
    "id": 2,
    "text": "I need assistance with my account.",
    "isAnswer": false,
    "hasImage": false,
    "imgPath": AppAssetsManager.onboardingImg2,
    "dateTime": "2024-11-14T12:35:01.123Z"
  },
  {
    "id": 3,
    "text": "Please check this image.",
    "isAnswer": false,
    "hasImage": true,
    "imgPath": AppAssetsManager.onboardingImg3,
    "dateTime": "2024-11-14T12:35:10.456Z"
  }
]
;

final listOfQuestions = <MessageEntity>[];

fillQuestionList() {
  for (var element in fakeJson) {
    listOfQuestions.add(MessageModel.fromMap(element));
  }
}