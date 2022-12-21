import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';


class DateAndTime extends StatefulWidget {
  const DateAndTime({super.key});

  @override
  State<DateAndTime> createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  bool showDate = false;
  bool showTime = false;
  bool showDateTime = false;

//select for date

  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(200),
        lastDate: DateTime(2025));
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }

  //select for time

  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });
    }
    return selectedTime;
  }

  //select date  time picker

  Future _selectedDateTime(BuildContext context) async {
    final date = await _selectDate(context);
    if (date == null) return;
    final time = await _selectTime(context);
    if (time == null) return;
    setState(() {
      dateTime =
          DateTime(date.year, date.month, date.day, time.hour, time.minute);
    });
  }

  String getDate() {
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('MMM d, yyyy').format(selectedDate);
    }
  }

  String getDateTime() {
    if (selectedTime == null) {
      return 'select timer';
    } else {
      return DateFormat('yyyy-M-dd HH: ss a').format(dateTime);
    }
  }

  String getTime(TimeOfDay tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 15),
            //   width: double.infinity,
            //   child: ElevatedButton(
            //       onPressed: () {
            //         _selectTime(context);
            //       },
            //       child: Text('Time picker')),
            // ),
            showTime
                ? Center(
                    child: Text(getTime(selectedTime)),
                  )
                : SizedBox(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    _selectedDateTime(context);
                    showDateTime = true;
                  },
                  child: Text('Selected Date and Time ')),
            ),
            showDateTime? Center(child: Text(getDateTime()),):SizedBox(),
          ],
        ),
      ),
    );
  }
}
