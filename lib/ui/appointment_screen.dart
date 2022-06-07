

import 'package:appointment/ui/edit_appointment.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../db/app_db.dart';
import '../db/appointment_entity.dart';
import '../widgets/local_notify_manager.dart';
import 'add_appointment.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  NotificationService localNotifyManager= NotificationService();
  Appointment appointment=Appointment();
  late AppDb _db;
  DateTime _selectedValue=DateTime.now();
  int currentIndex=0;

  @override
  void initState() {
    super.initState();
    _db=AppDb();
    localNotifyManager.initialize();
  }

  @override
  void dispose(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Appointment"),
          backgroundColor: const Color(0xff1222AC),
          centerTitle: true,
        ),
        body:Column(
          children: [
            _showCalender(),
            _showAppointments()
          ],
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff1222AC),
          onPressed: ()async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const addAppointment()),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),

    );
  }
  Widget buildButtons(BuildContext context, AppointmentData appointment) => Row(
    children: [
      Expanded(
        child: TextButton.icon(
            label: const Text('Edit',style:TextStyle(color: Color(0xff1222AC))),
            icon: const Icon(Icons.edit,color: Color(0xff1222AC),),
            onPressed: () {
              Get.to(EditAppointment(id: appointment.id));
            }
        ),
      ),
      Expanded(
        child: TextButton.icon(
            label: const Text('Delete',style:TextStyle(color: Color(0xff1222AC))),
            icon: const Icon(Icons.delete,color: Color(0xff1222AC)),
            onPressed: () {
              _db.deleteAppointment(appointment.id).then((value) => ScaffoldMessenger.of(context)
                  .showMaterialBanner(
                  MaterialBanner(
                    backgroundColor:Colors.red[700] ,
                    content: const Text('This Medicine deleted ',style:TextStyle(color: Colors.white),),
                    actions: [TextButton(
                        child:const Text('Close',style:TextStyle(color: Colors.white),) ,
                        onPressed:(){
                          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                          Get.back();
                        }
                    )
                    ],
                  )
              )
              );
              _db.allAppointments;
            }
        ),
      )
    ],
  );


  _showAppointments(){
    return  Expanded(
      child: FutureBuilder<List<AppointmentData>>(
        future:_db.getAppointments(),
        builder: (context,snapshot){
          final List<AppointmentData>? appointments=snapshot.data;

          if(snapshot.connectionState!=ConnectionState.done){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasError){
            return Center(
              child: Text(snapshot.hasError.toString()),
            );
          }
          if(appointment!=null) {

            return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView.builder(
                  itemCount: appointments?.length,
                  itemBuilder: (context, index) {
                    final appointment = appointments![index];
                    DateTime date = DateFormat.jm().parse(appointment.time.toString());
                    var myTime = DateFormat("HH:mm").format(date);
                    localNotifyManager.sheduledNotification(
                        int.parse(myTime.toString().split(':')[0]),
                        int.parse(myTime.toString().split(":")[1]),
                        appointment
                    );
                    print("Time: $myTime");
                    return  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.white,
                        child: ExpansionTile(
                          iconColor:  const Color(0xff1222AC),
                          tilePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                          title: Text(
                            appointment.place,
                            maxLines: 2,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Color(0xff1222AC),),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(appointment.person,style: const TextStyle(color:Colors.black,fontWeight: FontWeight.w600),),
                                Text(appointment.time,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600 ),),
                              ],
                            ),
                          ),
                          children: [
                            buildButtons(context, appointment),
                          ],
                        ),

                      ),
                    );
                  },
                )

            );
          }

          return const Text('No Appointment Found .');
        },
      ),
    );
  }

  _showCalender(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:30.0,bottom:15.0),
          child: DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor:const Color(0xff1222AC),
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              // New date selected
              setState(() {
                _selectedValue = date;
              });
            },
          ),
        ),
      ],
    );
  }

}

