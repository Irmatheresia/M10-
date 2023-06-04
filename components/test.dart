import 'package:flutter/material.dart';

class RingtoneDialog extends StatefulWidget {
  @override
  _RingtoneDialogState createState() => _RingtoneDialogState();
}

class _RingtoneDialogState extends State<RingtoneDialog> {
  String selectedRingtone = '';
  String appliedRingtone = '';

  List<String> ringtoneList = [
    'Ringtone 1',
    'Ringtone 2',
    'Ringtone 3',
    'Ringtone 4',
  ];

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ringtone "$appliedRingtone" berhasil diterapkan.'),
      ),
    );
  }

  void addItemToList() {
    setState(() {
      ringtoneList.add('Item baru');
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Pilih Ringtone'),
      content: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: ringtoneList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(ringtoneList[index]),
                  onTap: () {
                    setState(() {
                      selectedRingtone = ringtoneList[index];
                    });
                  },
                  selected: selectedRingtone == ringtoneList[index],
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  appliedRingtone = selectedRingtone;
                });
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Ringtone Terpilih',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              'Ringtone yang aktif saat ini: $appliedRingtone',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 16.0),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                showSnackBar();
                              },
                              child: Text('Cancle'),
                            ),
                            SizedBox(
                              height: 20,
                              width: 10,
                            ),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Item berhasil ditambahkan ke dalam list.'),
                                        duration: Duration(seconds: 2),
                                        action: SnackBarAction(
                                          label: 'Add ke dalam List',
                                          onPressed: () {
                                            addItemToList();
                                          },
                                        )),
                                  );
                                },
                                child: Text('Update'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ringtone App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return RingtoneDialog();
              },
            );
          },
          child: Text('Pilih Ringtone'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
