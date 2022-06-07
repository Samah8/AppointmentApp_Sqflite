import 'dart:io';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'appointment_entity.dart';
part 'app_db.g.dart';

LazyDatabase _openConnection(){
  return LazyDatabase(()async{

    final dbFolder=await getApplicationDocumentsDirectory();
    final file=File(path.join(dbFolder.path,'appointment.sqlite'));

    return NativeDatabase(file);
  });
}
@DriftDatabase(tables:[Appointment])
class AppDb  extends _$AppDb{

  AppDb():super(_openConnection());

  @override
  int get schemaVersion=>1;



  Future <List<AppointmentData>> getAppointments()async{
    return await select(appointment).get();
  }

  Stream<List<AppointmentData>> get allAppointments  {
    return  select(appointment).watch();
  }

  Future <AppointmentData> getAppointment(int id)async{
    return await (select(appointment)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future <bool> updateAppointment(AppointmentCompanion entity)async{
    return await update(appointment).replace(entity);
  }

  Future <int> insertAppointment(AppointmentCompanion entity)async{
    return await into(appointment).insert(entity);
  }

  Future <int> deleteAppointment(int id)async{
    return await (delete(appointment)..where((tbl) => tbl.id.equals(id))).go();
  }

}