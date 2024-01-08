import 'package:flutter/material.dart';
import 'features/route_info/presentation/pages/route_info_page.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
  runApp(const MyApp());
// master branch change it to bottom
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Routes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RouteInfoPage(),
    );
  }
}

