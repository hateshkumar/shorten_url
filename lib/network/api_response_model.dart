part of 'api_states.dart';

class ApiModel {
  late bool _success;
  late int _code;
  late String _message;
 late bool _status;
  dynamic _data;
  // ignore: unnecessary_getters_setters
  int get code => _code;
  // ignore: unnecessary_getters_setters
  set code(int value) {
    _code = value;
  }

  // ignore: unnecessary_getters_setters
  bool get status => _status;
  // ignore: unnecessary_getters_setters
  set status(bool value) {
    _status = value;
  }

  // ignore: unnecessary_getters_setters
  dynamic get data => _data;
  // ignore: unnecessary_getters_setters
  set data(dynamic value) {
    _data = value;
  }

  // ignore: unnecessary_getters_setters
  bool get success => _success;
  // ignore: unnecessary_getters_setters
  set success(bool value) {
    _success = value;
  }

  // ignore: unnecessary_getters_setters
  String get message => _message;
  // ignore: unnecessary_getters_setters
  set message(String value) {
    _message = value;
  }
}
