import 'package:flutter/material.dart';
// ignore: implementation_imports, unnecessary_import
import 'package:flutter/src/widgets/framework.dart';

class ScreenNull extends StatelessWidget {
  const ScreenNull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Stepper(type: StepperType.horizontal, steps: const [
          Step(title: Text("ffff"), content: CircleAvatar()),
          Step(title: Text("ffff"), content: CircleAvatar()),
          Step(title: Text("ffff"), content: CircleAvatar()),
        ]),
      ),
    );
  }
}
