import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../data/database.dart';
import '../models/data.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatelessWidget {
  final int index;
  final bool flagDashboard;

  const DetailScreen({Key? key, required this.index, required this.flagDashboard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = Database.getInstance().getDatabase();
    final database7Days = list7Days(database);
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta do Registo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (flagDashboard == false) ...[
              buildName(database[index].name),
              const SizedBox(height: 24),
              buildType(database[index].evaluationType),
              const SizedBox(height: 24),
              buildDate(database[index].dateTime),
              const SizedBox(height: 24),
              buildDifficulty(database[index].difficulty),
              const SizedBox(height: 24),
              buildObservations(database[index].obs),
            ] else ...[
            buildName(database7Days[index].name),
            const SizedBox(height: 24),
            buildType(database7Days[index].evaluationType),
            const SizedBox(height: 24),
            buildDate(database7Days[index].dateTime),
            const SizedBox(height: 24),
            buildDifficulty(database7Days[index].difficulty),
            const SizedBox(height: 24),
            buildObservations(database7Days[index].obs)
            ]
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ios_share),
        onPressed: () {
          share(context, database, index);
        },
      ),
    );
  }

  Widget buildName(String name) => Text(
      "Nome da Disciplina: $name"
  );

  Widget buildType(String type) => Text(
      "Tipo de Avaliação: $type"
  );

  Widget buildDate(DateTime date) => Text(
      "Data e Hora: ${formattedDate(date)}"
  );

  Widget buildDifficulty(int difficulty) => Text(
      "Nível de Dificuldade: $difficulty"
  );

  Widget buildObservations(String obs) => Text(
      "Observações: $obs"
  );

  String formattedDate(DateTime dateTime) {
    String date = DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
    return date;
  }

  list7Days(List<Data> database) {
    DateTime now = DateTime.now();
    DateTime now7days = now.add(Duration(days: 7));
    List<Data> data = [];

    for (int i = 0; i < database.length; i++) {
      if (database[i].dateTime.isAfter(now) && database[i].dateTime.isBefore(now7days)) {
        data.add(database[i]);
      }
    }

    return data;
  }

  void share(BuildContext context, List<Data> database, int index) {
    final message = "Mensagem do Dealer!!\n\nVamos ter avaliação de ${database[index].name}, em ${formattedDate(database[index].dateTime)}, com a dificuldade de ${database[index].difficulty} numa escala de 1 a 5.\n\n"
    "Observações para esta avaliação:\n${database[index].obs}";

    Share.share(message, subject: database[index].name);
  }
}
