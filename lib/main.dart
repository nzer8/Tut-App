import 'package:flutter/material.dart';
import 'package:tut_app/app/di.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initAppModule();
  runApp(MyApp());
}
