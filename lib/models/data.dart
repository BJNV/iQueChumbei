import 'package:intl/intl.dart';

class Data {
  String _name;
  String _evaluationType;
  DateTime _dateTime;
  int _difficulty;
  String _obs;

  Data(this._name, this._evaluationType, this._dateTime, this._difficulty, this._obs);

  String formattedDate() {
    String date = DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
    return date;
  }

  @override
  String toString() {
    return "$name - $evaluationType\n"
    "${formattedDate()}\n"
    "Nivel de Dificuldade - $difficulty";
  }


  String get name => _name;
  set name(String value) => _name = value;

  String get evaluationType => _evaluationType;
  set evaluationType(String value) => _evaluationType = value;

  DateTime get dateTime => _dateTime;
  set dateTime(DateTime value) => _dateTime = value;

  int get difficulty => _difficulty;
  set difficulty(int value) => _difficulty = value;

  String get obs => _obs;
  set obs(String value) => _obs = value;
}
