import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food/components/edit_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentPostion = 0;
  int timeLimit = 5;
  final _name = TextEditingController();

  void decreaseTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLimit > 0) {
          timeLimit--;
        } else {
          timer.cancel();
          timeLimit = 10;
        }
      });
    });
  }

  late final List<dynamic> mlist;
  Future<dynamic> fetchData() async {}
  @override
  void initState() {
    super.initState();
    decreaseTimer();
  }

  List<Step> stepsList() => [
        Step(
          state: currentPostion <= 0 ? StepState.editing : StepState.complete,
          isActive: currentPostion > 0,
          title: const Text('Personal'),
          content: Center(
            child: Column(
              children: [
                EditText(hint: 'username', isPassword: true, controller: _name),
                const SizedBox(height: 10),
                EditText(hint: 'email', isPassword: true, controller: _name),
                const SizedBox(height: 10),
                EditText(
                    hint: 'phone number', isPassword: true, controller: _name)
              ],
            ),
          ),
        ),
        Step(
          state: currentPostion <= 1 ? StepState.editing : StepState.complete,
          isActive: currentPostion >= 1,
          title: const Text('Acount'),
          content: Center(
            child: Column(
              children: [
                EditText(hint: 'address', isPassword: true, controller: _name),
                const SizedBox(height: 10),
                EditText(hint: 'state', isPassword: true, controller: _name),
                const SizedBox(height: 10),
                EditText(
                    hint: 'postal code', isPassword: true, controller: _name)
              ],
            ),
          ),
        ),
        Step(
          state: StepState.complete,
          isActive: currentPostion >= 2,
          title: const Text('Submit'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(timeLimit.toString()),
              const SizedBox(height: 15),
              MaterialButton(
                onPressed: () {
                  decreaseTimer();
                },
                child: const Text('Start'),
              )
            ],
          ),
        )
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: currentPostion,
        onStepContinue: () {
          setState(() {
            currentPostion < stepsList().length - 1
                ? currentPostion += 1
                : null;
          });
        },
        onStepCancel: () {
          setState(() {
            currentPostion > 0 ? currentPostion -= 1 : null;
          });
        },
        onStepTapped: (value) {
          setState(() {
            currentPostion = value;
          });
        },
        steps: stepsList(),
      ),
    );
  }
}
