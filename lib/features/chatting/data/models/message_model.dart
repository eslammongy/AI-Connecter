import 'package:ai_connect/features/chatting/domain/entities/answer_entity.dart';

class AnswerModel extends AnswerEntity {
  AnswerModel({
    super.text,
    super.isAnswer,
    super.hasFile,
    super.filePath,
    super.dateTime,
  });

  AnswerEntity copyWith({
    String? text,
    bool? isAnswer,
    bool? hasFile,
    String? filePath,
    DateTime? dateTime,
  }) {
    return AnswerEntity(
      text: text ?? this.text,
      isAnswer: isAnswer ?? this.isAnswer,
      hasFile: hasFile ?? this.hasFile,
      filePath: filePath ?? this.filePath,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'isAnswer': isAnswer,
      'hasFile': hasFile,
      'filePath': filePath,
      'dateTime': dateTime?.millisecondsSinceEpoch,
    };
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
      text: map['text'] != null ? map['text'] as String : null,
      isAnswer: map['isAnswer'] as bool,
      hasFile: map['hasImage'] as bool,
      filePath: map['imgPath'] != null ? map['imgPath'] as String : null,
      dateTime:
          map['dateTime'] != null ? DateTime.tryParse(map['dateTime']) : null,
    );
  }

  @override
  String toString() {
    return 'MessageEntity(id: $id, text: $text, isAnswer: $isAnswer, hasImage: $hasFile, imgPath: $filePath, dateTime: $dateTime)';
  }

  @override
  bool operator ==(covariant AnswerEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.text == text &&
        other.isAnswer == isAnswer &&
        other.hasFile == hasFile &&
        other.filePath == filePath &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        isAnswer.hashCode ^
        hasFile.hashCode ^
        filePath.hashCode ^
        dateTime.hashCode;
  }
}
