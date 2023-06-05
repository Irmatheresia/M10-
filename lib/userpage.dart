import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_2/provider/DialogProvider.dart';

class RingtoneList extends StatelessWidget {
  const RingtoneList({super.key});

  @override
  Widget build(BuildContext context) {
    DialogProvider dialogProvider = Provider.of<DialogProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 16),
          MaterialBanner(
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Settings',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('Text ${dialogProvider.selectedOption}'),
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
                        builder: (context) =>
                            showAlertDialog(context, dialogProvider)),
                    child: const Text('Phone Ringtone')),
              ]),
        ],
      ),
    );
  }

  showBanner(BuildContext context) {
    return MaterialBanner(
      content: const Text("Flutter Tutorial"),
      leading: const Icon(
        Icons.folder,
        color: Colors.orange,
      ),
      actions: [
        TextButton(
            onPressed: () => ScaffoldMessenger.of(context)
                .showSnackBar(showSnackBar(context)),
            child: const Text("Update")),
        TextButton(
          onPressed: () =>
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
          child: const Text('Dismiss'),
        ),
      ],
    );
  }

  showSnackBar(BuildContext context) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 6),
      content: Row(
        children: [
          Icon(Icons.info),
          SizedBox(width: 8),
          Flexible(child: Text('Hey User Custome Snackbar!!'))
        ],
      ),
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.white,
        onPressed: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
      ),
    );
  }

  showAlertDialog(BuildContext context, DialogProvider dialogProvider) {
    return AlertDialog(
      title: const Text('Phone Ringtone'),
      content: SingleChildScrollView(
          child: Container(
        width: 30,
        height: 340,
        child: ListView(children: getRadioListTile(context, dialogProvider)),
      )),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Accept'),
        ),
      ],
    );
  }

  getRadioListTile(BuildContext context, DialogProvider dialogProvider) {
    return List.generate(dialogProvider.options.length, (index) {
      String option = dialogProvider.options[index];

      return RadioListTile<String?>(
        title: Text(option),
        value: option,
        groupValue: dialogProvider.selectedOption,
        onChanged: (String? value) {
          dialogProvider.selectedOption = value;
          print('test');
        },
      );
    });
  }
}
