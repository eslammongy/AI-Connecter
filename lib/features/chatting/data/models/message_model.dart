import 'package:ai_connect/features/chatting/domain/entities/message_entity.dart';

class MessageModel  extends MessageEntity{

   MessageModel({
     super.id,
     super.text,
     super.isAnswer,
     super.hasImage,
     super.imgPath,
     super.dateTime,
  });



  MessageEntity copyWith({
    int? id,
    String? text,
    bool? isAnswer,
    bool? hasImage,
    String? imgPath,
    DateTime? dateTime,
  }) {
    return MessageEntity(
      id: id ?? this.id,
      text: text ?? this.text,
      isAnswer: isAnswer ?? this.isAnswer,
      hasImage: hasImage ?? this.hasImage,
      imgPath: imgPath ?? this.imgPath,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'isAnswer': isAnswer,
      'hasImage': hasImage,
      'imgPath': imgPath,
      'dateTime': dateTime?.millisecondsSinceEpoch,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as int,
      text: map['text'] != null ? map['text'] as String : null,
      isAnswer: map['isAnswer'] as bool,
      hasImage: map['hasImage'] as bool,
      imgPath: map['imgPath'] != null ? map['imgPath'] as String : null,
      dateTime: map['dateTime'] != null ? DateTime.tryParse(map['dateTime']) : null,
    );
  }



  @override
  String toString() {
    return 'MessageEntity(id: $id, text: $text, isAnswer: $isAnswer, hasImage: $hasImage, imgPath: $imgPath, dateTime: $dateTime)';
  }

  @override
  bool operator ==(covariant MessageEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.text == text &&
      other.isAnswer == isAnswer &&
      other.hasImage == hasImage &&
      other.imgPath == imgPath &&
      other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      text.hashCode ^
      isAnswer.hashCode ^
      hasImage.hashCode ^
      imgPath.hashCode ^
      dateTime.hashCode;
  }
}
