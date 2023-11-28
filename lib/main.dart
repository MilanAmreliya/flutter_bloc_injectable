import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/all_bloc_provider.dart';
import 'package:flutter_bloc_demo/screen.dart';

import 'inject/inject_file.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await configureDependencies();
    },
    (error, stackTrace) {
      if (kDebugMode) {
        print('Error occurred: $error');
        print(stackTrace);
      }
    },
    zoneSpecification: new ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String message) {
        if (kDebugMode) {
          parent.print(zone, message);
        }
      },
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: provider,
      child: MaterialApp(
        title: 'Flutter Demo',
        home: BlocDemoScreen(),
      ),
    );
  }
}
