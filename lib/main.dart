import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Message app",
      home: draft(),
    );
  }
}

class draft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
      ),
      body: mainScreen(),
    );
  }
}

class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  TextEditingController t1 = TextEditingController();
  List messages = [];

  addMessages(String text) {
    setState(() {
      messages.insert(0, text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        children: [
          Flexible(
              child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) => Text(messages[index]))),
          Row(
            children: [
              Flexible(
                child: TextField(
                  onSubmitted: addMessages,
                  decoration: new InputDecoration(hintText: "Type Here"),
                  controller: t1,
                ),
              ),
              ElevatedButton.icon(
                // <-- ElevatedButton
                onPressed: addMessages(t1.text),
                label: Text('Send'),
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
