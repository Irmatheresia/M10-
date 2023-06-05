import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RingtoneList extends StatefulWidget {
  const RingtoneList({super.key});

  @override
  State<RingtoneList> createState() => _RingtoneListState();
}

class _RingtoneListState extends State<RingtoneList> {
  final List<String> options = [
    'None',
    'Callisto',
    'Ganeymede',
    'Luna',
    'Oberon',
    'Phobos',
    'Dione',
    'Sakura',
    'Sneakers',
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
                    Text('Text ${selectedOption}'),
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
                    child: const Text('Phone Ringtone')),
                // TextButton(
                //     onPressed: () => showDialog(
                //         context: context,
                //         builder: (context) => showSimpleDialog(context)),
                //     child: const Text('Simple Dialog')),
                // TextButton(
                //     onPressed: () => ScaffoldMessenger.of(context)
                //         .showSnackBar(showSnackBar(context)),
                //     child: const Text('Snackbars')),
                // TextButton(
                //     onPressed: () => Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             fullscreenDialog: true,
                //             builder: ((context) => FullScreenDialog()))),
                //     child: const Text('Fullscreen Dialog'))
              ]),
        ],
      ),
    );
  }

  // showSimpleDialog(BuildContext context) {
  //   return SimpleDialog(
  //     title: const Text('Phone Ringtone'),
  //     children: List.generate(4, (index) {
  //       return SimpleDialogOption(
  //         onPressed: () => Navigator.pop(context, 'mail$index@mail.com'),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             const Icon(Icons.abc, size: 36.0, color: Colors.amber),
  //             Padding(
  //               padding: const EdgeInsets.only(left: 16.0),
  //               child: Text('Username$index'),
  //             ),
  //           ],
  //         ),
  //       );
  //     }),
  //   );
  // }

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

  showAlertDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Phone Ringtone'),
      content: SingleChildScrollView(
        child: Container(
            width: 30,
            height: 340,
            child: ListView(children: getRadioListTile(context))),
      ),
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

  List<RadioListTile> getRadioListTile(BuildContext context) {
    return List.generate(options.length, (index) {
      return RadioListTile<String?>(
        title: Text(options[index]),
        value: options[index],
        groupValue: selectedOption,
        onChanged: (String? value) {
          setState(() {
            selectedOption = value!;
            // print(selectedOption);
          });
        },
      );
    });
  }
}


// class ShowAlertDialog extends StatefulWidget {
//   const ShowAlertDialog({super.key});

//   @override
//   State<ShowAlertDialog> createState() => _ShowAlertDialogState();
// }

// class _ShowAlertDialogState extends State<ShowAlertDialog> {
//   final List<String> options = [
//     'None',
//     'Callisto',
//     'Ganeymede',
//     'Luna',
//     'Oberon',
//     'Phobos',
//     'Dione',
//     'Sakura',
//     'Sneakers',
//   ];

//   String? selectedOption;

//   @override
//   void initState() {
//     super.initState();
//     selectedOption = options[0];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Phone Ringtone'),
//       content: SingleChildScrollView(
//         child: Container(
//           width: 30,
//           height: 340,
//           child: ListView.builder(
//             shrinkWrap: true,
//             itemCount: options.length,
//             itemBuilder: (BuildContext context, int index) {
//               return RadioListTile<String?>(
//                 title: Text(options[index]),
//                 value: options[index],
//                 groupValue: selectedOption,
//                 onChanged: (String? value) {
//                   setState(() {
//                     selectedOption = value!;
//                     print(selectedOption);
//                   });
//                 },
//               );
//             },
//           ),
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Text('Cancel'),
//         ),
//         TextButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Accept'),
//         ),
//       ],
//     );
//   }
// }
