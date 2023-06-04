import 'package:flutter_application_1/components/fullscreen_dialog_widget.dart';
import 'package:flutter/material.dart';

class AddNew extends StatefulWidget {
  const AddNew({super.key});

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  // List<String> ringtoneList = [
  //   'Ringtone 1',
  //   'Ringtone 2',
  //   'Ringtone 3',
  //   'Ringtone 4',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(height: 16),
        MaterialBanner(
            content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Baner',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Text'),
                ]),
            actions: [
              TextButton(
                  onPressed: () => ScaffoldMessenger.of(context)
                    ..removeCurrentMaterialBanner()
                    ..showMaterialBanner(showBanner(context)),
                  child: const Text('Show Banner')),
              TextButton(
                  onPressed: () => showDialog(
                    context: context, 
                    builder: (context) => showAlertDialog(context)),
                  child: const Text('Alert Dialog')),
              TextButton(
                  onPressed: () => showDialog(
                    context: context, 
                    builder: (context) => showSimpleDialog(context)),
                  child: const Text('Simple Dialog')),
              TextButton(
                  onPressed: () => Navigator.push(
                    context, 
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: ((context) => FullScreenDialog()))),
                  child: const Text('Fullscreen Dialog'))    
            ]),
      ]),
    );
  }

  showBanner(BuildContext context) {
    return MaterialBanner(
      content: const Text("Welcome"),
      leading: const Icon(
        Icons.info,
        color: Colors.orange,
      ),
      actions: [
        TextButton(onPressed: () {}, child: const Text("Agree")),
        TextButton(
          onPressed: () =>
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
          child: const Text('Dismiss'),
        ),
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Reset Setting'),
      content: const Text(
          'This will reset your device to its default factory settings'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancle'),
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Accept')),
      ],
    );
  }

  showSimpleDialog(BuildContext context) {
    return SimpleDialog(
      title: const Text('Set Backup Account'),
      children: List.generate(4, (index) {
        return SimpleDialogOption(
          onPressed: () => Navigator.pop(context, 'mail$index@mail.com'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.abc, size: 36.0, color: Colors.amber),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text('Username$index'),
              ),
            ],
          ),
        );
        
      }),
    );
  }
}
