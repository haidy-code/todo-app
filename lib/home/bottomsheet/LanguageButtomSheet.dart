import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/home/AppConfigProvider.dart';


class LanguageButtomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.changelanguage('en');
              },
              child: provider.applang == 'en'
                  ? getselecteditem('English', context)
                  : getunselecteditem('English', context)),
          InkWell(
              onTap: () {
                provider.changelanguage('ar');
              },
              child: provider.applang == 'ar'
                  ? getselecteditem('Arabic', context)
                  : getunselecteditem('Arabic', context))
        ],
      ),
    );
  }

  Widget getselecteditem(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
          Icon(
            Icons.check,
            color: Colors.blue,
          )
        ],
      ),
    );
  }

  Widget getunselecteditem(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(text, style: TextStyle(color: Colors.black, fontSize: 18))
        ],
      ),
    );
  }
}