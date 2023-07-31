import 'package:flutter/material.dart';
import 'package:food/chat_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: const MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  Future<bool> exitDialog(BuildContext context) async {
    bool exitApp = await showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: const Text('warning'),
            content: const Text('Do you want exit?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Yes')),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (builder) {
                      return const ChatPage();
                    }),
                  );
                },
                child: const Text('No'),
              ),
            ],
          );
        });
    return exitApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: const Column(
          children: [Text('data')],
        ));
  }
}
