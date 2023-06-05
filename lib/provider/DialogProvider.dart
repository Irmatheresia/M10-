import 'package:flutter/material.dart';

class DialogProvider extends ChangeNotifier {
  final List<String> _options = [
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

  String? _selectedOption = 'None';

  List<String> get options => _options;
  String? get selectedOption => _selectedOption;
  set selectedOption(String? option) {
    _selectedOption = option!;
    notifyListeners();
  }
}
