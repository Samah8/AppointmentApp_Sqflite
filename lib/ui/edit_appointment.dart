
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' as drift;
import '../db/app_db.dart';
import '../widgets/custom_text_form_field.dart';


class EditAppointment extends StatefulWidget {
final int id;
  const EditAppointment({Key? key, required this.id}) : super(key: key);
  @override
  _EditAppointmentState createState() => _EditAppointmentState();
}

class _EditAppointmentState extends State<EditAppointment> {
  late AppDb _db;
  late AppointmentData _appointmentData;
  final TextEditingController _namecontroller =TextEditingController();
  final TextEditingController _notecontroller =TextEditingController();
  late final TextEditingController _startDcontroller =TextEditingController();
  late final TextEditingController _timecontroller =TextEditingController();
  late final TextEditingController _personcontroller =TextEditingController();
  late final TextEditingController _remcontroller =TextEditingController();
  DateTime _startDate=DateTime.now();
  TimeOfDay? _selectedTime;
  int _selectedremind=8;
  List<int>remindlist=[ 8,12, 24];


  @override
  void initState(){
    super.initState();
    _db=AppDb();
    getAppointment();

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _namecontroller.dispose();
    _notecontroller.dispose();
    _startDcontroller.dispose();
    _timecontroller.dispose();
    _personcontroller.dispose();
    _remcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text(('Edit Appointment')),
        backgroundColor: const Color(0xff1222AC),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: (){
                editAppointment();
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0,top: 6.0),
                child: Text("Save",style: TextStyle(color: Colors.white,fontSize: 16),),
              )
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: ListView(
            children: [
              SizedBox(height: 15),
              Text("Where is it?",style:GoogleFonts.sansita(textStyle:const TextStyle(
                  fontSize: 15,
                  color: Color(0xff1222AC),
                  fontWeight: FontWeight.w500)
              ),
              ),
              InputField(hint: ' ',controller: _namecontroller,),
              const SizedBox(height: 5.0,),
              Text("Who is it with?",style:GoogleFonts.sansita(textStyle:const TextStyle(
                  fontSize: 15,
                  color: Color(0xff1222AC),
                  fontWeight: FontWeight.w500)
              ),
              ),
              InputField( hint: '',controller: _personcontroller, ),
              const SizedBox(height: 15.0,),
              Text("Appointment Date",style:GoogleFonts.sansita(textStyle:const TextStyle(
                  fontSize: 15,
                  color: Color(0xff1222AC),
                  fontWeight: FontWeight.w500)
              ),
              ),
              CustomDatepickerFormField(controller: _startDcontroller, title: "",
                  callback: (){
                    pickDate(context);
                  }),
              const SizedBox(height: 10.0,),
              Text("Time",style:GoogleFonts.sansita(textStyle:const TextStyle(
                  fontSize: 15,
                  color: Color(0xff1222AC),
                  fontWeight: FontWeight.w500)
              ),
              ),
              CustomDatepickerFormField(controller: _timecontroller, title: "",
                  callback: (){
                    pickTime(context);
                  }),
              const SizedBox(height: 10.0,),
              Text("Remind me",style:GoogleFonts.sansita(textStyle:const TextStyle(
                  fontSize: 15,
                  color: Color(0xff1222AC),
                  fontWeight: FontWeight.w500)
              ),
              ),
              InputField( hint:"Before  $_selectedremind hours",controller: _remcontroller,
                widget:DropdownButton(
                    elevation:4,
                    underline: Container(width: 0),
                    icon:const Icon(Icons.keyboard_arrow_down,color: Colors.grey),
                    iconSize: 32,
                    onChanged: (String? newval){
                      setState(() {
                        _selectedremind=int.parse(newval!);
                        _remcontroller.text=newval;
                      });
                    },
                    items:remindlist.map<DropdownMenuItem<String>>((int value)
                    {
                      return DropdownMenuItem<String> (
                        value: value.toString(),
                        child: Text(value.toString()),
                      );
                    }
                    ).toList()
                ) ,
              ),
              const SizedBox(height: 7.0,),
              Text("Notes",style:GoogleFonts.sansita(textStyle:const TextStyle(
                  fontSize: 15,
                  color: Color(0xff1222AC),
                  fontWeight: FontWeight.w500)
              ),
              ),
              InputField(controller: _notecontroller,hint: '',),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> pickDate(BuildContext context)async{
    final newDate=await showDatePicker(
        context: context,
        initialDate:_startDate,
        firstDate:DateTime(DateTime.now().year-10),
        lastDate: DateTime(DateTime.now().year+2)
    );
    if(newDate==null){
      return;
    }
    setState(() {
      _startDate=newDate;
      String date=DateFormat.yMd().format(newDate);
      _startDcontroller.text=date;
    });
  }
  Future<void> pickTime(BuildContext context)async{
    TimeOfDay initialTime=TimeOfDay.now();
    final  timeOfDay=
    await showTimePicker(context: context,
        initialTime:_selectedTime??initialTime
    );
    if(timeOfDay!=null) {
      setState(() {
        _selectedTime=timeOfDay;
        String time=timeOfDay.format(context);
        _timecontroller.text=time;
      });
    }
  }

   void editAppointment(){
    final entity=AppointmentCompanion(
        id: drift.Value(widget.id),
        place: drift.Value(_namecontroller.text),
        person: drift.Value(_personcontroller.text),
        note: drift.Value(_notecontroller.text),
        time: drift.Value(_timecontroller.text),
        remind:drift.Value(int.parse(_remcontroller.text)),
        appointment_Date: drift.Value(_startDate),

    );
   _db.updateAppointment(entity).then((value) => ScaffoldMessenger.of(context)
        .showMaterialBanner(
        MaterialBanner(
          backgroundColor:Colors.blue[900] ,
          content: const Text('This Appointment updated  ',style:TextStyle(color: Colors.white),),
          actions: [TextButton(
              child:const Text('Close',style:TextStyle(color: Colors.white),) ,
              onPressed:() {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                Get.back();
              })],
        )
    )
    );
          _db.allAppointments;
  }



  Future <void> getAppointment ()async{
    _appointmentData=await _db.getAppointment(widget.id);
    _namecontroller.text=_appointmentData.place;
    _personcontroller.text=_appointmentData.person;
    _notecontroller.text=_appointmentData.note;
    _startDcontroller.text=_appointmentData.appointment_Date.toIso8601String();
    _remcontroller.text=_appointmentData.remind.toString();
    _timecontroller.text=_appointmentData.time;
  }
}