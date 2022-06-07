// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class AppointmentData extends DataClass implements Insertable<AppointmentData> {
  final int id;
  final String place;
  final String person;
  final String time;
  final int remind;
  final DateTime appointment_Date;
  final String note;
  AppointmentData(
      {required this.id,
      required this.place,
      required this.person,
      required this.time,
      required this.remind,
      required this.appointment_Date,
      required this.note});
  factory AppointmentData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AppointmentData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      place: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}Place'])!,
      person: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}Person'])!,
      time: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}Time'])!,
      remind: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}Remind'])!,
      appointment_Date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}Appointment_Date'])!,
      note: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}Note'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['Place'] = Variable<String>(place);
    map['Person'] = Variable<String>(person);
    map['Time'] = Variable<String>(time);
    map['Remind'] = Variable<int>(remind);
    map['Appointment_Date'] = Variable<DateTime>(appointment_Date);
    map['Note'] = Variable<String>(note);
    return map;
  }

  AppointmentCompanion toCompanion(bool nullToAbsent) {
    return AppointmentCompanion(
      id: Value(id),
      place: Value(place),
      person: Value(person),
      time: Value(time),
      remind: Value(remind),
      appointment_Date: Value(appointment_Date),
      note: Value(note),
    );
  }

  factory AppointmentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppointmentData(
      id: serializer.fromJson<int>(json['id']),
      place: serializer.fromJson<String>(json['place']),
      person: serializer.fromJson<String>(json['person']),
      time: serializer.fromJson<String>(json['time']),
      remind: serializer.fromJson<int>(json['remind']),
      appointment_Date: serializer.fromJson<DateTime>(json['appointment_Date']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'place': serializer.toJson<String>(place),
      'person': serializer.toJson<String>(person),
      'time': serializer.toJson<String>(time),
      'remind': serializer.toJson<int>(remind),
      'appointment_Date': serializer.toJson<DateTime>(appointment_Date),
      'note': serializer.toJson<String>(note),
    };
  }

  AppointmentData copyWith(
          {int? id,
          String? place,
          String? person,
          String? time,
          int? remind,
          DateTime? appointment_Date,
          String? note}) =>
      AppointmentData(
        id: id ?? this.id,
        place: place ?? this.place,
        person: person ?? this.person,
        time: time ?? this.time,
        remind: remind ?? this.remind,
        appointment_Date: appointment_Date ?? this.appointment_Date,
        note: note ?? this.note,
      );
  @override
  String toString() {
    return (StringBuffer('AppointmentData(')
          ..write('id: $id, ')
          ..write('place: $place, ')
          ..write('person: $person, ')
          ..write('time: $time, ')
          ..write('remind: $remind, ')
          ..write('appointment_Date: $appointment_Date, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, place, person, time, remind, appointment_Date, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppointmentData &&
          other.id == this.id &&
          other.place == this.place &&
          other.person == this.person &&
          other.time == this.time &&
          other.remind == this.remind &&
          other.appointment_Date == this.appointment_Date &&
          other.note == this.note);
}

class AppointmentCompanion extends UpdateCompanion<AppointmentData> {
  final Value<int> id;
  final Value<String> place;
  final Value<String> person;
  final Value<String> time;
  final Value<int> remind;
  final Value<DateTime> appointment_Date;
  final Value<String> note;
  const AppointmentCompanion({
    this.id = const Value.absent(),
    this.place = const Value.absent(),
    this.person = const Value.absent(),
    this.time = const Value.absent(),
    this.remind = const Value.absent(),
    this.appointment_Date = const Value.absent(),
    this.note = const Value.absent(),
  });
  AppointmentCompanion.insert({
    this.id = const Value.absent(),
    required String place,
    required String person,
    required String time,
    required int remind,
    required DateTime appointment_Date,
    required String note,
  })  : place = Value(place),
        person = Value(person),
        time = Value(time),
        remind = Value(remind),
        appointment_Date = Value(appointment_Date),
        note = Value(note);
  static Insertable<AppointmentData> custom({
    Expression<int>? id,
    Expression<String>? place,
    Expression<String>? person,
    Expression<String>? time,
    Expression<int>? remind,
    Expression<DateTime>? appointment_Date,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (place != null) 'Place': place,
      if (person != null) 'Person': person,
      if (time != null) 'Time': time,
      if (remind != null) 'Remind': remind,
      if (appointment_Date != null) 'Appointment_Date': appointment_Date,
      if (note != null) 'Note': note,
    });
  }

  AppointmentCompanion copyWith(
      {Value<int>? id,
      Value<String>? place,
      Value<String>? person,
      Value<String>? time,
      Value<int>? remind,
      Value<DateTime>? appointment_Date,
      Value<String>? note}) {
    return AppointmentCompanion(
      id: id ?? this.id,
      place: place ?? this.place,
      person: person ?? this.person,
      time: time ?? this.time,
      remind: remind ?? this.remind,
      appointment_Date: appointment_Date ?? this.appointment_Date,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (place.present) {
      map['Place'] = Variable<String>(place.value);
    }
    if (person.present) {
      map['Person'] = Variable<String>(person.value);
    }
    if (time.present) {
      map['Time'] = Variable<String>(time.value);
    }
    if (remind.present) {
      map['Remind'] = Variable<int>(remind.value);
    }
    if (appointment_Date.present) {
      map['Appointment_Date'] = Variable<DateTime>(appointment_Date.value);
    }
    if (note.present) {
      map['Note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppointmentCompanion(')
          ..write('id: $id, ')
          ..write('place: $place, ')
          ..write('person: $person, ')
          ..write('time: $time, ')
          ..write('remind: $remind, ')
          ..write('appointment_Date: $appointment_Date, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $AppointmentTable extends Appointment
    with TableInfo<$AppointmentTable, AppointmentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppointmentTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _placeMeta = const VerificationMeta('place');
  @override
  late final GeneratedColumn<String?> place = GeneratedColumn<String?>(
      'Place', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _personMeta = const VerificationMeta('person');
  @override
  late final GeneratedColumn<String?> person = GeneratedColumn<String?>(
      'Person', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<String?> time = GeneratedColumn<String?>(
      'Time', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _remindMeta = const VerificationMeta('remind');
  @override
  late final GeneratedColumn<int?> remind = GeneratedColumn<int?>(
      'Remind', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _appointment_DateMeta =
      const VerificationMeta('appointment_Date');
  @override
  late final GeneratedColumn<DateTime?> appointment_Date =
      GeneratedColumn<DateTime?>('Appointment_Date', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String?> note = GeneratedColumn<String?>(
      'Note', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, place, person, time, remind, appointment_Date, note];
  @override
  String get aliasedName => _alias ?? 'appointment';
  @override
  String get actualTableName => 'appointment';
  @override
  VerificationContext validateIntegrity(Insertable<AppointmentData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('Place')) {
      context.handle(
          _placeMeta, place.isAcceptableOrUnknown(data['Place']!, _placeMeta));
    } else if (isInserting) {
      context.missing(_placeMeta);
    }
    if (data.containsKey('Person')) {
      context.handle(_personMeta,
          person.isAcceptableOrUnknown(data['Person']!, _personMeta));
    } else if (isInserting) {
      context.missing(_personMeta);
    }
    if (data.containsKey('Time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['Time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('Remind')) {
      context.handle(_remindMeta,
          remind.isAcceptableOrUnknown(data['Remind']!, _remindMeta));
    } else if (isInserting) {
      context.missing(_remindMeta);
    }
    if (data.containsKey('Appointment_Date')) {
      context.handle(
          _appointment_DateMeta,
          appointment_Date.isAcceptableOrUnknown(
              data['Appointment_Date']!, _appointment_DateMeta));
    } else if (isInserting) {
      context.missing(_appointment_DateMeta);
    }
    if (data.containsKey('Note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['Note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppointmentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AppointmentData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AppointmentTable createAlias(String alias) {
    return $AppointmentTable(attachedDatabase, alias);
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $AppointmentTable appointment = $AppointmentTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [appointment];
}
