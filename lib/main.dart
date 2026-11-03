import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import './pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // supaya tanggal bisa memakai bahasa Indonesia
  await initializeDateFormatting('id_ID', null);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}