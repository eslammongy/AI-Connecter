// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'features/chatting/domain/entities/chat_entity.dart';
import 'features/chatting/domain/entities/message_entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 8248337740717628147),
      name: 'ChatEntity',
      lastPropertyId: const obx_int.IdUid(2, 1205280911085146653),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 6094765016040820112),
            name: 'id',
            type: 6,
            flags: 129)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[
        obx_int.ModelBacklink(
            name: 'history', srcEntity: 'MessageEntity', srcField: '')
      ]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(4, 2781195762046084675),
      name: 'MessageEntity',
      lastPropertyId: const obx_int.IdUid(7, 8012861659051901636),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 7072613295233920238),
            name: 'id',
            type: 6,
            flags: 129),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 7171797621404258435),
            name: 'text',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 8374945047920953128),
            name: 'filePath',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 8256888281787862497),
            name: 'rule',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 241178118713971499),
            name: 'sentAt',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 8813076200884821610),
            name: 'chatId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(3, 6041271803203078139),
            relationTarget: 'ChatEntity'),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 8012861659051901636),
            name: 'dataBytesPath',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(4, 2781195762046084675),
      lastIndexId: const obx_int.IdUid(3, 6041271803203078139),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [3699295683555704535, 1532487961949111136],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        1205280911085146653,
        4875770531630963642,
        7570656634633151491,
        3597503333711375445,
        3144465794846129876,
        8617014170746875722,
        6509421349888709252,
        6701635854394249877,
        5671687554709857855,
        9027601501842539231,
        1661602670834294493,
        5675783507523042832
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    ChatEntity: obx_int.EntityDefinition<ChatEntity>(
        model: _entities[0],
        toOneRelations: (ChatEntity object) => [],
        toManyRelations: (ChatEntity object) => {
              obx_int.RelInfo<MessageEntity>.toOneBacklink(6, object.id,
                  (MessageEntity srcObject) => srcObject.chat): object.history
            },
        getId: (ChatEntity object) => object.id,
        setId: (ChatEntity object, int id) {
          object.id = id;
        },
        objectToFB: (ChatEntity object, fb.Builder fbb) {
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final object = ChatEntity(id: idParam);
          obx_int.InternalToManyAccess.setRelInfo<ChatEntity>(
              object.history,
              store,
              obx_int.RelInfo<MessageEntity>.toOneBacklink(
                  6, object.id, (MessageEntity srcObject) => srcObject.chat));
          return object;
        }),
    MessageEntity: obx_int.EntityDefinition<MessageEntity>(
        model: _entities[1],
        toOneRelations: (MessageEntity object) => [object.chat],
        toManyRelations: (MessageEntity object) => {},
        getId: (MessageEntity object) => object.id,
        setId: (MessageEntity object, int id) {
          object.id = id;
        },
        objectToFB: (MessageEntity object, fb.Builder fbb) {
          final textOffset =
              object.text == null ? null : fbb.writeString(object.text!);
          final filePathOffset = object.filePath == null
              ? null
              : fbb.writeString(object.filePath!);
          final ruleOffset =
              object.rule == null ? null : fbb.writeString(object.rule!);
          final dataBytesPathOffset = object.dataBytesPath == null
              ? null
              : fbb.writeString(object.dataBytesPath!);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, textOffset);
          fbb.addOffset(2, filePathOffset);
          fbb.addOffset(3, ruleOffset);
          fbb.addInt64(4, object.sentAt?.millisecondsSinceEpoch);
          fbb.addInt64(5, object.chat.targetId);
          fbb.addOffset(6, dataBytesPathOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final sentAtValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 12);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final textParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 6);
          final filePathParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 8);
          final dataBytesPathParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 16);
          final ruleParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 10);
          final sentAtParam = sentAtValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(sentAtValue);
          final object = MessageEntity(
              id: idParam,
              text: textParam,
              filePath: filePathParam,
              dataBytesPath: dataBytesPathParam,
              rule: ruleParam,
              sentAt: sentAtParam);
          object.chat.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);
          object.chat.attach(store);
          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [ChatEntity] entity fields to define ObjectBox queries.
class ChatEntity_ {
  /// See [ChatEntity.id].
  static final id =
      obx.QueryIntegerProperty<ChatEntity>(_entities[0].properties[0]);

  /// see [ChatEntity.history]
  static final history =
      obx.QueryBacklinkToMany<MessageEntity, ChatEntity>(MessageEntity_.chat);
}

/// [MessageEntity] entity fields to define ObjectBox queries.
class MessageEntity_ {
  /// See [MessageEntity.id].
  static final id =
      obx.QueryIntegerProperty<MessageEntity>(_entities[1].properties[0]);

  /// See [MessageEntity.text].
  static final text =
      obx.QueryStringProperty<MessageEntity>(_entities[1].properties[1]);

  /// See [MessageEntity.filePath].
  static final filePath =
      obx.QueryStringProperty<MessageEntity>(_entities[1].properties[2]);

  /// See [MessageEntity.rule].
  static final rule =
      obx.QueryStringProperty<MessageEntity>(_entities[1].properties[3]);

  /// See [MessageEntity.sentAt].
  static final sentAt =
      obx.QueryDateProperty<MessageEntity>(_entities[1].properties[4]);

  /// See [MessageEntity.chat].
  static final chat = obx.QueryRelationToOne<MessageEntity, ChatEntity>(
      _entities[1].properties[5]);

  /// See [MessageEntity.dataBytesPath].
  static final dataBytesPath =
      obx.QueryStringProperty<MessageEntity>(_entities[1].properties[6]);
}
