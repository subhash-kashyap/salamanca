import 'package:flutter/material.dart';
import 'package:salamanca/familia.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(DingDing());
}

class DingDing extends StatefulWidget {
  DingDing({super.key});

  @override
  State<DingDing> createState() => _DingDingState();
}

class _DingDingState extends State<DingDing> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BrBa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: VillianWidget(),
    );
  }
}
