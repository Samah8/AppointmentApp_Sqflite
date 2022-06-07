import 'package:drift/drift.dart';


class Appointment extends Table{

  IntColumn get id => integer().autoIncrement()();
  TextColumn get place=>text().named('Place')();
  TextColumn get person=>text().named('Person')();
  TextColumn get time=>text().named('Time')();
  IntColumn get remind=>integer().named('Remind')();
  DateTimeColumn get appointment_Date=>dateTime().named('Appointment_Date')();
  TextColumn get note=> text().named('Note')();
}