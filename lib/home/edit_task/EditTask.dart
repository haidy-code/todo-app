import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/data/FirebaseUtils.dart';
import 'package:todo_app/data/Todo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditTask extends StatefulWidget {
  static const String routename='edit_task';

  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  var formkey = GlobalKey<FormState>(); //bi5leny access alform fe ay 7ta

  late Todo item;
  @override
  Widget build(BuildContext context) {
     item=ModalRoute.of(context)!.settings.arguments as Todo;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'TO do list',
          style: TextStyle(
            color: Theme.of(context).cardColor
          ),
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Container(
width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.1,
            color: Theme.of(context).primaryColor,
          ),
          Container(
            margin: EdgeInsets.all(35),
            height: MediaQuery.of(context).size.height*0.75 ,
            width: MediaQuery.of(context).size.width*0.9,
            decoration: BoxDecoration(

              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12)
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.edit_task,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            initialValue: item.title,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.todo_title,
                              labelStyle: Theme.of(context).textTheme.headline4,
                            ),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'please enter todo title';
                              }
                              return null;
                            },
                            onChanged: (text) {
                             item.title = text;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            initialValue: item.description,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.todo_details,
                              labelStyle: Theme.of(context).textTheme.headline4,
                            ),
                            minLines: 5,
                            maxLines: 5,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'please enter todo details';
                              }
                              return null;
                            },
                            onChanged: (text) {
                             item.description = text;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(

                      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                      child: Text(
                        AppLocalizations.of(context)!.select_date,
                        style: Theme.of(context).textTheme.headline3,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          showpopupcalender();
                        },
                        child: Text(

                              '${item.dateTime.day}/${item.dateTime.month}/${item.dateTime.year}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).canvasColor
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(35),
                    padding:EdgeInsets.all(15) ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: ElevatedButton(

                        onPressed: () {
                        editTodo();
                        },
                        child: Text(AppLocalizations.of(context)!.save_changes),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),

                                )
                            )
                        )),

                  )
                ],
              ),
            ),
          )
        ],
      ),

    );
  }

  Future<void> showpopupcalender() async {
    var newselectedday = await showDatePicker(
      context: context,
      initialDate: item.dateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (newselectedday != null) {
     item.dateTime = newselectedday;
      setState(() {});
    }
  }

  void editTodo() {
    editTaskDetails(item).then((value) {
      Navigator.pop(context);
    });

  }
}
