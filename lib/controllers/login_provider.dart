import 'package:flutter/material.dart';


class LoginNotifier extends ChangeNotifier {
  bool _obscureText = true;

  bool get obscureText => _obscureText;

  set obscureText(bool newState) {
    _obscureText = newState;
    notifyListeners();
  }

  bool? _entrypoint;

  bool get entrypoint => _entrypoint??false;

  set entrypoint(bool newState) {
    entrypoint = newState;
    notifyListeners();
  }

}








