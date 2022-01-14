import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home/AppConfigProvider.dart';
import 'package:todo_app/home/tasks_list/Todo_list_tab.dart';
import 'bottom_shett/Add_task_bottom_sheet.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'settings/Todo_setting_tab.dart';

class HomeScreen extends StatefulWidget {
  static const routename = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex=0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        //make navigation bar notched (rounded)
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        elevation: 0,
        //make navigation bar notched (rounded)
        child: BottomNavigationBar(
          onTap: (index) {
            currentindex=index;
            setState(() {

            });
          },
          elevation: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //make border of floating action botton
        shape: StadiumBorder(side: BorderSide(color: Theme.of(context).cardColor, width: 4)),
        //make border of floating action botton
        child: Icon(Icons.add),
        onPressed: () {
          addnewtask();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.app_title,style: TextStyle(color: Theme.of(context).cardColor),
        ),
        centerTitle: false,
      ),
      body: tabs[currentindex],
    );
  }

  List<Widget>tabs=[Todo_list_tab(),Todo_setting_tab()];

  void addnewtask() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return (Add_task_bottom_sheet());
        });
  }
}
