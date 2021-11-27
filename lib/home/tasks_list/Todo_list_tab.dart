import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_app/data/FirebaseUtils.dart';
import 'package:todo_app/data/Todo.dart';
import 'package:todo_app/home/tasks_list/Todo_task_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Todo_list_tab extends StatefulWidget {
  @override
  _Todo_list_tabState createState() => _Todo_list_tabState();
}

class _Todo_list_tabState extends State<Todo_list_tab> {
  DateTime selected_day = DateTime.now();

  DateTime focused_day = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          TableCalendar(
            locale: Localizations.localeOf(context).languageCode,
            calendarFormat: CalendarFormat.week, //3shan yzhr week wa7d
            firstDay: DateTime.now().subtract(Duration(days: 365)),
            lastDay: DateTime.now().add(Duration(days: 365)),
            focusedDay: focused_day,
            onDaySelected: (sday, fday) {
              setState(() {
                selected_day = sday;
                focused_day = fday;
              });
            },
            selectedDayPredicate: (day) {
              //dh 3shan yzhr fe ui an selected day at8irt (bt3ml chech alyom ally atba3tlha selected wla l2 )
              return isSameDay(day, selected_day);
            },
            calendarStyle: CalendarStyle(
                selectedTextStyle: TextStyle(color: Colors.white),
                selectedDecoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                todayTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(8),
                ),
                defaultDecoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                defaultTextStyle: TextStyle(color: Theme.of(context).canvasColor)),
            weekendDays: [], // 3shan mai5lesh ay yom mainfa3sh ydas 3lah (ba2olo mafesh weekends)
            daysOfWeekStyle: DaysOfWeekStyle(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            headerStyle: HeaderStyle(
              titleTextStyle: TextStyle(color: Theme.of(context).canvasColor)
            ),
          ),
          //futurebuilder lw onetime read mn data base
          //future:getTodosCollectionWithConverter().get()
          ///lw makontsh ast5dmt firestore knt hadtar a3ml provider 3shan alisten 3la changes
          Expanded(child: StreamBuilder<QuerySnapshot<Todo>>(
            stream:getTodosCollectionWithConverter().where('dateTime',
                isEqualTo:
                selected_day.getDateOnly().millisecondsSinceEpoch)
                .snapshots() ,
            builder:(context, AsyncSnapshot<QuerySnapshot<Todo>> snapshot){
              if (snapshot.hasError) {
                return Text('Error loading todos');
              } else if (snapshot.connectionState ==
                  ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              List<Todo> items = snapshot.data!.docs
                  .map((documents) => documents.data())//function btlf 3la kol documents w tgeb data ally gwahom fkda hatgeb altodo
                  .toList();
              return ListView.builder(itemBuilder: (context,index){
                return Todo_task_item(items[index]);
              },itemCount: items.length,);
            } ,
          )
          )
        ],
      ),
    );
  }
}
