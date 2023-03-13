import 'package:flutter_test/flutter_test.dart';
import 'package:mini_projeto/data/database.dart';
import 'package:mini_projeto/models/data.dart';

void main() {

  test("registo inserido na database", () {
    final database = Database.getInstance().getDatabase();
    expect(database.length, 6);

    Data registo = Data("Computação Móvel", "Projeto", DateTime(2023, 03, 13, 23, 59), 2, "Entrega mini-projeto Flutter");
    Database.getInstance().insert(registo.name, registo.evaluationType, registo.dateTime, registo.difficulty, registo.obs);
    expect(database.length, 7);
  });

  test("registo editado", () {
    int index = 0;
    final database = Database.getInstance().getDatabase();
    expect(database[index].name, "Ontem");
    expect(database[index].evaluationType, "Frequência");
    expect(database[index].dateTime, DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1, DateTime.now().hour + 1, 15));
    expect(database[index].difficulty, 2);
    expect(database[index].obs, "Exemplo Ontem");

    Database.getInstance().edit("Computação Móvel", "Projeto", DateTime(2023, 03, 13, 23, 59), 2, "Entrega mini-projeto Flutter", database[index].name, database[index].evaluationType, database[index].dateTime, database[index].difficulty, database[index].obs);
    expect(database[index].name, "Computação Móvel");
    expect(database[index].evaluationType, "Projeto");
    expect(database[index].dateTime, DateTime(2023, 03, 13, 23, 59));
    expect(database[index].difficulty, 2);
    expect(database[index].obs, "Entrega mini-projeto Flutter");
  });

}
