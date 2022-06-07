
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class InputField extends StatelessWidget {
  final intial ;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final  Function(dynamic) ?onclick;
  const InputField ({Key? key, required this.hint,this.intial,this.controller, this.widget,  this.onclick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 52,
            margin:const EdgeInsets.only(top: 8.0),
            padding:const EdgeInsets.only(left: 8.0) ,
            decoration:BoxDecoration(
                border:Border.all(
                    color: Colors.grey,
                    width: 1.0
                ),
                borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                Expanded(
                    child:TextFormField(
                      initialValue:intial ,
                      autofocus: false,
                      cursorColor:Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: hint,

                      ),

                      onChanged:onclick,
                      validator: (title)=>title!=null&&title.isEmpty?'cannot be empty':null,
                    )
                ),
                widget==null?Container():Container(child: widget)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDatepickerFormField extends StatelessWidget {
  final TextEditingController _controller;
  final String title;
  final  VoidCallback _callback;
  const CustomDatepickerFormField({
    Key? key,
    required TextEditingController controller,
    required VoidCallback callback, required this.title,
  })
      :_controller=controller  , _callback=callback ,super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(height: 9.0),
        TextFormField(
          readOnly: true,
          controller: _controller,
          decoration:  InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),

          ),
          validator: (value){
            if(value==null || value.isEmpty){
              return '$title Cannot be empty';
            }
            return null;
          },
          onTap: _callback,
        ),
      ],
    );
  }
}