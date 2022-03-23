import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/data/FirebaseUtils.dart';
import 'package:todo_app/data/Todo.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/home/MythemeData.dart';
import 'package:todo_app/home/edit_task/EditTask.dart';


class Todo_task_item extends StatelessWidget {
  Todo item;

  Todo_task_item(this.item);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, EditTask.routename,arguments: item);
          },
          child: getitemdesign(item.isDone, context)),
      actionPane: SlidableDrawerActionPane(),
      actions: [
        IconSlideAction(
          color: Colors.transparent,
          iconWidget: Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.delete),
                Text(
                  'delete',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          onTap: () {
            deleteTodo(item).onError((error, stackTrace) {
              Fluttertoast.showToast(
                  msg: error.toString(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black45,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }).then((value) {
              Fluttertoast.showToast(
                  msg: "deleating is succesful",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black45,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }).timeout(Duration(seconds: 30), onTimeout: () {
              Fluttertoast.showToast(
                  msg: "timeout",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black45,
                  textColor: Colors.white,
                  fontSize: 16.0);
            });
          },
        )
      ],
    );
  }

  Widget getitemdesign(bool isdone, BuildContext context) {
    if (isdone) {
      return Container(
        margin: EdgeInsets.only(top: 8,bottom: 8),
        height:
            120, //adet llcontainer height 3shan hwa kan shail height alitems ally gwah(makontsh 3arfa a3ml space evenly fe items ally gwa coloumn)

        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 4,
              color: Theme.of(context).primaryColor,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                            fontSize: 18, color: Colors.lightGreen),
                      ),
                      Text(
                        item.description,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                editisdoneoftask(item, false);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  'Done',
                  style: TextStyle(fontSize: 18, color: Colors.lightGreen),
                ),
              ),
            )
          ],
        ),
      );
    }
    return Container(
      margin: EdgeInsets.only(top: 8,bottom: 8),
      height:
          120, //adet llcontainer height 3shan hwa kan shail height alitems ally gwah(makontsh 3arfa a3ml space evenly fe items ally gwa coloumn)

      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color:Theme.of(context).cardColor, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 4,
            color: Theme.of(context).primaryColor,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      item.description,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              editisdoneoftask(item, true);

              getitemdesign(item.isDone, context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Image.asset('assets/images/Icon-check.png'),
            ),
          )
        ],
      ),
    );
  }
}
