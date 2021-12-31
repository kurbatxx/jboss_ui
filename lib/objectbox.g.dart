// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';

import 'db_model/entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 1043975842650127212),
      name: 'Device',
      lastPropertyId: const IdUid(4, 5689316615481674787),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3551224217508818918),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 6759350164728545036),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6598167859169618208),
            name: 'price',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 5689316615481674787),
            name: 'colored',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 2689399643959320265),
      name: 'DeviceColor',
      lastPropertyId: const IdUid(1, 6007302844212097567),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6007302844212097567),
            name: 'id',
            type: 6,
            flags: 1)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 5835826959139121943),
      name: 'Settings',
      lastPropertyId: const IdUid(2, 4098594869245617096),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6237161878799796147),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 4098594869245617096),
            name: 'appDir',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Store openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) =>
    Store(getObjectBoxModel(),
        directory: directory,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(3, 5835826959139121943),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Device: EntityDefinition<Device>(
        model: _entities[0],
        toOneRelations: (Device object) => [],
        toManyRelations: (Device object) => {},
        getId: (Device object) => object.id,
        setId: (Device object, int id) {
          object.id = id;
        },
        objectToFB: (Device object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addInt64(2, object.price);
          fbb.addBool(3, object.colored);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Device(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              name:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              price: const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0),
              colored: const fb.BoolReader()
                  .vTableGet(buffer, rootOffset, 10, false));

          return object;
        }),
    DeviceColor: EntityDefinition<DeviceColor>(
        model: _entities[1],
        toOneRelations: (DeviceColor object) => [],
        toManyRelations: (DeviceColor object) => {},
        getId: (DeviceColor object) => object.id,
        setId: (DeviceColor object, int id) {
          object.id = id;
        },
        objectToFB: (DeviceColor object, fb.Builder fbb) {
          fbb.startTable(2);
          fbb.addInt64(0, object.id);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = DeviceColor(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));

          return object;
        }),
    Settings: EntityDefinition<Settings>(
        model: _entities[2],
        toOneRelations: (Settings object) => [],
        toManyRelations: (Settings object) => {},
        getId: (Settings object) => object.id,
        setId: (Settings object, int id) {
          object.id = id;
        },
        objectToFB: (Settings object, fb.Builder fbb) {
          final appDirOffset = fbb.writeString(object.appDir);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, appDirOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Settings(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              appDir:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Device] entity fields to define ObjectBox queries.
class Device_ {
  /// see [Device.id]
  static final id = QueryIntegerProperty<Device>(_entities[0].properties[0]);

  /// see [Device.name]
  static final name = QueryStringProperty<Device>(_entities[0].properties[1]);

  /// see [Device.price]
  static final price = QueryIntegerProperty<Device>(_entities[0].properties[2]);

  /// see [Device.colored]
  static final colored =
      QueryBooleanProperty<Device>(_entities[0].properties[3]);
}

/// [DeviceColor] entity fields to define ObjectBox queries.
class DeviceColor_ {
  /// see [DeviceColor.id]
  static final id =
      QueryIntegerProperty<DeviceColor>(_entities[1].properties[0]);
}

/// [Settings] entity fields to define ObjectBox queries.
class Settings_ {
  /// see [Settings.id]
  static final id = QueryIntegerProperty<Settings>(_entities[2].properties[0]);

  /// see [Settings.appDir]
  static final appDir =
      QueryStringProperty<Settings>(_entities[2].properties[1]);
}