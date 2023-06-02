

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unicor_app/src/presentantion/context/export_context.dart';
import '../../widgets/export_widget.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: CustomAppBarPhoto(
        leadingWidget: TextButton(
          child:  Icon(Icons.menu),
          style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
          onPressed: () {
          //  scaffoldKey.currentState!.openDrawer();
          },
        )  
        ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only( left: 20 , right: 20),
            child: Row(
              children: [
                Container(
                  child: Column(
                      crossAxisAlignment :  CrossAxisAlignment.start, 
                    children: [
                      Text (DateFormat.yMMMd().format(DateTime.now())),
                    ]),
                )
                  
              ]
              ),
          ),

            Container(
                      child: DatePicker(
                            DateTime.now(),
                            height: 100,
                            width: 80,
                            initialSelectedDate: DateTime.now(),
                            selectionColor: AppAssets.primaryColor,
                            selectedTextColor: Colors.white,
                            onDateChange: (date) {
                              // New date selected
                              // setState(() {
                              //   _selectedValue = date;
                              // }
                              // );
                            },
                          ),
                    ),


        ],
      ),
      bottomNavigationBar: AppNavBar(),
    );
  }
}