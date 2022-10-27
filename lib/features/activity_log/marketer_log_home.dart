import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jedmgr/core/constants/contants.dart';
import 'package:jedmgr/core/themes/theme_colors.dart';
import 'package:jedmgr/features/activity_log/controller/activity_controller.dart';
import 'package:jedmgr/features/activity_log/my_log_card.dart';
import 'package:table_calendar/table_calendar.dart';

class MarketerHomeLog extends StatefulWidget {
  final String token, date;
  const MarketerHomeLog({Key? key, required this.token, required this.date})
      : super(key: key);

  @override
  State<MarketerHomeLog> createState() => _MarketerHomeLogState();
}

class _MarketerHomeLogState extends State<MarketerHomeLog> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  final ActivityController _activity = ActivityController.to;

  @override
  void initState() {
    super.initState();
    print("selectedDate ${widget.date}");
    _selectedDay = _focusedDay;

    _activity.date(widget.date);
    _activity.displayActivityLog(widget.token);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _activity.date(
            "${selectedDay.year}-${selectedDay.month}-${selectedDay.day}");
        _activity.displayActivityLog(widget.token);
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        titleSpacing: -5,
        title: const Text('My Activity Log'),
      ),
      body: Container(
        padding: const EdgeInsets.all(9),
        margin: const EdgeInsets.only(
          left: 5.0,
          right: 5.0,
          top: 5,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: ThemeColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              blurRadius: 8.0,
              offset: Offset(
                0.0,
                4.0,
              ),
              color: ThemeColors.shadowColor,
            )
          ],
        ),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2022, 03, 01),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                rangeStartDay: _rangeStart,
                rangeEndDay: _rangeEnd,
                calendarFormat: _calendarFormat,
                rangeSelectionMode: _rangeSelectionMode,
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: const CalendarStyle(
                  // Use `CalendarStyle` to customize the UI
                  outsideDaysVisible: false,
                ),
                onDaySelected: _onDaySelected,
                onRangeSelected: _onRangeSelected,
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
              const SizedBox(height: 8.0),
              Obx(() {
                if (_activity.isLoading.value) {
                  return const Center(child: Text('loading...'));
                } else {
                  return _activity.activityModelList != null
                      ? ListView.builder(
                          itemCount: _activity.activityModelList.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (context, index) {
                            return MyLogCard(
                              activity: _activity.activityModelList[index]
                                  ['activity'],
                              date: getDateTime(
                                  _activity.activityModelList[index]['date']),
                              time: getTime(
                                  _activity.activityModelList[index]['time']),
                              location: _activity.activityModelList[index]
                                  ['location'],
                            );
                          })
                      : const Center(
                          child: Text('No Activity for this date'),
                        );
                }
              }),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
