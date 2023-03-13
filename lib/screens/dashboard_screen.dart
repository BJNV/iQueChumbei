import 'package:flutter/material.dart';
import 'package:mini_projeto/models/data.dart';
import '../data/database.dart';
import 'detail_screen.dart';

class DashboardScreen extends StatefulWidget {

  final String title;

  DashboardScreen({Key? key, required this.title}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();

}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {
    final database = Database.getInstance().getDatabase();
    List<Data> database7Days = list7Days(database);
    final bool flag = true;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Text("Média de Dificuldade (7 dias)", style: TextStyle(fontWeight: FontWeight.w700), textAlign: TextAlign.center),
              const SizedBox(height: 24),
              Text("${average7Days(database)}"),
              const SizedBox(height: 48),
              Text("Média de Dificuldade (7 a 14 dias)", style: TextStyle(fontWeight: FontWeight.w700), textAlign: TextAlign.center),
              const SizedBox(height: 24),
              Text("${average7to14Days(database)}"),
              const SizedBox(height: 48),
              Text("Lista de Avaliações (7 dias)", style: TextStyle(fontWeight: FontWeight.w700)),
              const SizedBox(height: 24),
              Expanded(
                  child: ListView.builder(
                      itemCount: database7Days.length,
                      itemBuilder: (context, index) {
                        final item = database7Days[index].dateTime;
                        final colors = getBackgroundColor(item);
                        return Card(
                          color: colors,
                          child: ListTile(
                            contentPadding: EdgeInsets.all(12),
                            leading: Image.asset('lib/assets/logo.jpg'),
                            title: Text(
                              database7Days[index].toString(),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DetailScreen(index: index, flagDashboard: flag))
                              );
                            },
                          ),
                        );
                      }
                  )
              )
            ],
          ),
      ),
    );
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

  String average7Days(List<Data> database) {
    DateTime now = DateTime.now();
    DateTime now7days = now.add(Duration(days: 7));
    List<Data> data = [];
    double mean = 0;

    for (int i = 0; i < database.length; i++) {
      if (database[i].dateTime.isAfter(now) && database[i].dateTime.isBefore(now7days)) {
        data.add(database[i]);
      }
    }

    for (int m = 0; m < data.length; m++) {
      mean += data[m].difficulty;
    }

    if (mean == 0) {
      return "0";
    } else {
      return (mean / data.length).toStringAsFixed(2);
    }

  }

  String average7to14Days(List<Data> database) {
    DateTime now = DateTime.now();
    DateTime sevenDays = now.add(Duration(days: 7));
    DateTime fourteenDays = now.add(Duration(days: 14));
    List<Data> data = [];
    double mean = 0;

    for (int i = 0; i < database.length; i++) {
      if (database[i].dateTime.isAfter(sevenDays) && database[i].dateTime.isBefore(fourteenDays)) {
        data.add(database[i]);
      }
    }

    for (int m = 0; m < data.length; m++) {
      mean += data[m].difficulty;
    }

    if (mean == 0) {
      return "0";
    } else {
      return (mean / data.length).toStringAsFixed(2);
    }

  }

  isToday(DateTime date) {
    DateTime now = DateTime.now();

    if (date.day == now.day) {
      return true;
    }

    return false;
  }

  isNextDayOrMonday(DateTime date) {
    DateTime now = DateTime.now();
    DateTime tomorrow = now.add(Duration(days: 1));

    if (date.day == tomorrow.day) {
      return true;
    }

    if (now.weekday == 5 || now.weekday == 6) {
      if (date.weekday == 1) {
        return true;
      }
    }

    return false;
  }

  Color getBackgroundColor(DateTime date) {
    DateTime now = DateTime.now();
    DateTime tomorrow = now.add(Duration(days: 1));

    if (date.day == now.day) {
      return Colors.red;
    }

    if (date.day == tomorrow.day) {
      return Colors.orange;
    }

    if (now.weekday == 5 || now.weekday == 6) {
      if (date.weekday == 1) {
        return Colors.orange;
      }
    }

    return Colors.white;
  }
}