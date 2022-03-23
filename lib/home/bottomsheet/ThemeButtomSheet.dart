import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../AppConfigProvider.dart';


class ThemeButtomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.changetheme(ThemeMode.light);
              },
              child: provider.apptheme == ThemeMode.light
                  ? getselecteditem(
                  AppLocalizations.of(context)!.light, context)
                  : getunselecteditem(
                  AppLocalizations.of(context)!.light, context)),
          InkWell(
              onTap: () {
                provider.changetheme(ThemeMode.dark);
              },
              child: provider.apptheme == ThemeMode.dark
                  ? getselecteditem(AppLocalizations.of(context)!.dark, context)
                  : getunselecteditem(
                  AppLocalizations.of(context)!.dark, context))
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