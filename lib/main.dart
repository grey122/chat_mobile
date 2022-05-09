import 'package:chat_mobile/bottom_nav_bar.dart';
import 'package:chat_mobile/chats.dart';
import 'package:chat_mobile/conversations.dart';
import 'package:chat_mobile/models/messages.dart';
import 'package:chat_mobile/models/recent_user.dart';
import 'package:chat_mobile/people.dart';
import 'package:chat_mobile/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(RecentUserAdapter());
  Hive.registerAdapter(MessageAdapter());

  final users = await Hive.openBox<RecentUser>("sumarachat");

// add dummy users
  if (users.values.toList().cast<RecentUser>().isEmpty) {
    for (var element in recentUsers) {
      users.put(element.id, element);
    }
  }

  runApp(
    MaterialApp(
      //  routerDelegate: ,

      title: 'Chat Mobile',
      theme: ThemeData(
        // accentColor: colorSchemeData.secondary,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          systemOverlayStyle: lightTaskBar,
          elevation: 0.0,
          centerTitle: false,
        ),

        // primarySwatch: colorSchemeData.secondary,

        // accentTextTheme: textThemeData,
      ),

      home: const BottomSheetScreen(),
    ),
  );
}

const SystemUiOverlayStyle lightTaskBar = SystemUiOverlayStyle(
  statusBarColor: Colors.black,
  statusBarBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.light,
);
