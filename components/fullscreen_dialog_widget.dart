import 'package:flutter/material.dart';

class FullScreenDialog extends StatelessWidget {
  const FullScreenDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialBanner(content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Snackbars', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Text('Snackbars provide brief messages about app processes at the bottom of the screen.')
            ]),
            actions: [
              TextButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(showSnackBar(context)), child: const Text('Snackbars'))
            ]),
      appBar: AppBar(
        title: const Text('Full-screen Dialog'),
      ),
      );
  }

  showSnackBar(BuildContext context) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 6),
      content: const Text('Welcome to Snackbar'),
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.white,
        onPressed: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
      ),
      
    );
  }
}

