import 'package:flutter/material.dart';
import 'package:mobile_create/app/app.dart';
import 'package:mobile_create/app/core/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();
  runApp(const App());
}
