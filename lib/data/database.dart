import '../models/data.dart';

class Database {
  final List<Data> _database = [
    Data("Ontem", "Frequência", DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1, DateTime.now().hour + 1, 15), 2, "Exemplo Ontem"),
    Data("Hoje", "Defesa", DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour + 1, 30), 5, ""),
    Data("Amanhã", "Mini-Teste", DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1, DateTime.now().hour + 1, 45), 4, "Exemplo Amanhã"),
    Data("Depois de Amanha", "Projeto", DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2, DateTime.now().hour + 1, 00), 3, ""),
    Data("Próxima Semana 1", "Mini-Teste", DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 8, DateTime.now().hour + 1, 30), 1, "Exemplo Próxima Semana 1"),
    Data("Próxima Semana 2", "Projeto", DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 12, DateTime.now().hour + 1, 00), 4, "Exemplo Próxima Semana 2"),
  ];

  Database();

  static Database _instance = Database._internal();

  Database._internal();

  static Database getInstance() {
    if (_instance == null) {
      _instance = Database._internal();
    }
    return _instance;
  }

  List<Data> getDatabase() {
    _database.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return _database;
  }

  void insert(String name, String evaluationType, DateTime dateTime, int difficulty, String obs) {
    _database.add(Data(name, evaluationType, dateTime, difficulty, obs));
  }

  void edit(String name, String evaluationType, DateTime dateTime, int difficulty, String obs, String oldName, String oldEvaluationType, DateTime oldDateTime, int oldDifficulty, String oldObs) {
    for (int i = 0; i < _database.length; i++) {
      if (oldName == _database[i].name && oldEvaluationType == _database[i].evaluationType && oldDateTime == _database[i].dateTime && oldDifficulty == _database[i].difficulty && oldObs == _database[i].obs) {
        _database[i].name = name;
        _database[i].evaluationType = evaluationType;
        _database[i].dateTime = dateTime;
        _database[i].difficulty = difficulty;
        _database[i].obs = obs;
      }

    }
  }

}