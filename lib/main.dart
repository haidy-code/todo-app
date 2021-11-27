import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'file:///C:/flutter%20projects/todo_app/lib/home/HomeScreen.dart';
import 'file:///C:/flutter%20projects/todo_app/lib/home/MythemeData.dart';
import 'package:todo_app/home/edit_task/EditTask.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home/AppConfigProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<AppConfigProvider>(
      create: (buildContext) {
        return AppConfigProvider();
      },
      child: MyApp())
  );
}

class MyApp extends StatelessWidget {
 late SharedPreferences preferences;
 late var provider;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    initsharedpref();
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.applang),
      theme: MythemeData.lighttheme,
      darkTheme: MythemeData.darktheme,
      themeMode: provider.apptheme,
      routes: {
        HomeScreen.routename: (buildcontext) => HomeScreen(),
        EditTask.routename: (buildcontext) => EditTask()
      },
      initialRoute: HomeScreen.routename,

    );
  }

  void initsharedpref() async {
    preferences=await SharedPreferences.getInstance();
    provider.changelanguage(preferences.getString('lang')?? 'en');//bageb ally fe shared w lw bnull ha7oe english
    if(preferences.getString('theme')=='light'){
      provider.changetheme(ThemeMode.light);
    }
    else if(preferences.getString('theme')=='dark'){
      provider.changetheme(ThemeMode.dark);
    }
  }
}