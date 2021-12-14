import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final bool? isColored;

  const SettingsPage({Key? key, this.isColored}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isColored = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Назад'))
            ],
          ),
          Column(
            children: [
              TextFormField(),
              TextFormField(),
              TextFormField(),
              CheckboxListTile(
                  value: isColored,
                  onChanged: (value) {
                    setState(() {
                      isColored = !isColored;
                    });
                  }),
            ],
          )
        ],
      ),
    );
  }
}
