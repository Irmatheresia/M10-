import 'package:flutter/material.dart';

class MyHolla extends StatefulWidget {
  @override
  _MyHolla createState() => _MyHolla();
}

class _MyHolla extends State<MyHolla> {
  final List<String> options = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5',
  ];

  String? selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = options[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter AlertDialog with ListView'),
      ),
      body: Center(
        child: TextButton(
          child: Text('Show Dialog'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return AlertDialog(
                      title: Text('Select an option'),
                      content: Container(
                        width: double.maxFinite,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: options.length,
                          itemBuilder: (BuildContext context, int index) {
                            return RadioListTile<String?>(
                              title: Text(options[index]),
                              value: options[index],
                              groupValue: selectedOption,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedOption = value;
                                });
                              },
                            );
                          },
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            if (selectedOption != null) {
                              print('Selected option: $selectedOption');
                            }
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
