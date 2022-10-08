import 'package:flutter/foundation.dart';

class User {
  final String? id;
  final String? email;
  final String? username;

  const User({
    @required this.id,
    @required this.email,
    @required this.username,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};

    void addNotNull(String? key, String? value) {
      if (value != null) {
        data[key!] = value;
      }
    }

    addNotNull('id', id);
    addNotNull('email', email);
    addNotNull('username', username);

    return data;
  }
}
