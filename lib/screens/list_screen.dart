import 'package:flutter/material.dart';
import 'package:mini_projeto/screens/detail_screen.dart';
import 'package:mini_projeto/screens/editing_screen.dart';
import '../data/database.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/data.dart';

class ListScreen extends StatefulWidget {
  final String title;
  final Database database;

  ListScreen({Key? key, required this.title, required this.database})
      : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    List<Data> database = Database.getInstance().getDatabase();
    final bool flag = false;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: ListView.builder(
              itemCount: database.length,
              itemBuilder: (context, index) {
                final item = database[index].dateTime;
                final colors = getBackgroundColor(item);
                return Slidable(
                  endActionPane: ActionPane(
                    motion: StretchMotion(),
                    children: [
                      SlidableAction(
                        onPressed: ((context) async {
                          if (database[index].dateTime.day > DateTime.now().day) {
                            final newValues = await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EditingScreen(
                                    name: database[index].name,
                                    evaluationType: database[index].evaluationType,
                                    dateTime: database[index].dateTime,
                                    difficulty: database[index].difficulty.toString(),
                                    obs: database[index].obs)
                                ));
                            setState(() {
                              database = newValues ?? database;
                            });
                          } else {
                            final message = "Só podem ser editados registos de avaliações futuras.";
                            final snackBar = SnackBar(
                              content: Text(message),
                              backgroundColor: Colors.red,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        }),
                        backgroundColor: Colors.blue,
                        icon: Icons.edit,
                      ),
                      SlidableAction(
                        onPressed: ((context) {
                          if (database[index].dateTime.day > DateTime.now().day) {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                    title: Text("Eliminar permanentemente este registo?", textAlign: TextAlign.center),
                                    actions: [
                                      Center(
                                        child: Column(
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                  setState(() {
                                                    Database.getInstance().getDatabase().removeAt(index);
                                                  });
                                                  Navigator.of(context).pop();
                                                  final message = "O registo de avaliação selecionado foi eliminado com sucesso.";
                                                  final snackBar = SnackBar(
                                                    content: Text(message),
                                                    backgroundColor: Colors.green,
                                                  );
                                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                              },
                                              child: Text("Eliminar", style: TextStyle(color: Colors.red)),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.of(context).pop(),
                                              child: Text("Cancelar"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]
                                ));
                          } else {
                            final message = "Só podem ser eliminados registos de avaliações futuras.";
                            final snackBar = SnackBar(
                              content: Text(message),
                              backgroundColor: Colors.red,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }

                        }),
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                      )
                    ],
                  ),
                  child: Card(
                    color: colors,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(12),
                      leading: Image.asset('lib/assets/logo.jpg'),
                      title: Text(
                        database[index].toString(),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DetailScreen(index: index, flagDashboard: flag))
                        );
                      },
                    ),
                  ),
                );
              }),
      ),
    );
  }

  Color getBackgroundColor(DateTime date) {
    DateTime now = DateTime.now();
    DateTime tomorrow = now.add(Duration(days: 1));
    DateTime nextWeek = now.add(Duration(days: 7));
    
    if (date.day < now.day) {
      return Colors.green;
    }

    if (date.day == now.day) {
      return Colors.red;
    }

    if (date.day == tomorrow.day) {
      return Colors.orange;
    }

    if (now.weekday == 5 || now.weekday == 6) {
      if (date.weekday == 1 && date.isBefore(nextWeek)) {
        return Colors.orange;
      }
    }

    return Colors.white;
  }
  
}
