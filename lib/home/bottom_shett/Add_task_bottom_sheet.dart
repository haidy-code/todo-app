import 'package:flutter/material.dart';
import 'package:todo_app/data/FirebaseUtils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Add_task_bottom_sheet extends StatefulWidget {
  @override
  _Add_task_bottom_sheetState createState() => _Add_task_bottom_sheetState();
}

class _Add_task_bottom_sheetState extends State<Add_task_bottom_sheet> {
  var formkey = GlobalKey<FormState>(); //bi5leny access alform fe ay 7ta
  DateTime selectedDate = DateTime.now();
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).cardColor,
      child: Container(
color: Theme.of(context).cardColor,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.add_new_task,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3,
              ),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
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
                        title = text;
                      },
                    ),
                    TextFormField(
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
                        description = text;
                      },
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
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
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                      textAlign: TextAlign.center,style: TextStyle(
                      color: Theme.of(context).canvasColor
                    ),
                    )),
              ),
              ElevatedButton(
                  onPressed: () {
                    addTodo();
                  },
                  child: Text(AppLocalizations.of(context)!.add_task))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showpopupcalender() async {
    var newselectedday = await showDatePicker(
locale: Locale(Localizations.localeOf(context).languageCode),
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (newselectedday != null) {
      selectedDate = newselectedday;
      setState(() {});
    }
  }

  void addTodo() {
    if (!formkey.currentState!.validate()) {
      return;
    }
    //if valid then insert new todo item
    addTodoToFirestore(title, description, selectedDate)
        .then((value) {
          Navigator.pop(context);//success to write in database
    })
        .onError((error, stackTrace) {
      print(error.toString());
    })
          ..timeout(Duration(seconds: 30), onTimeout: () {
            print('fail to reach to server');
          });
  }
}
