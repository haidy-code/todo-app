import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home/AppConfigProvider.dart';

import 'package:todo_app/home/bottomsheet/LanguageButtomSheet.dart';
import 'package:todo_app/home/bottomsheet/ThemeButtomSheet.dart';




class Todo_setting_tab extends StatefulWidget {
  @override
  _Todo_setting_tabState createState() => _Todo_setting_tabState();
}

class _Todo_setting_tabState extends State<Todo_setting_tab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language),
          InkWell(
            onTap: show_lang_buttomsheet,
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.applang),
                  Icon(Icons.arrow_drop_down_sharp)
                ],
              ),
            ),
          ),
          Text(AppLocalizations.of(context)!.theme),
          InkWell(
            onTap: show_theme_buttomsheet,
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.apptheme == ThemeMode.light
                      ? AppLocalizations.of(context)!.light
                      : AppLocalizations.of(context)!.dark),
                  Icon(Icons.arrow_drop_down_sharp)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  show_lang_buttomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildcontext) {
          return LanguageButtomSheet();
        });
  }

  show_theme_buttomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildcontext) {
          return ThemeButtomSheet();
        });
  }
}

