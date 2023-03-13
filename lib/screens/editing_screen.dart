import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:date_field/date_field.dart';
import 'package:mini_projeto/data/database.dart';

class EditingScreen extends StatefulWidget {
  String name;
  String evaluationType;
  DateTime dateTime;
  String difficulty;
  String obs;

  EditingScreen(
      {Key? key,
      required this.name,
      required this.evaluationType,
      required this.dateTime,
      required this.difficulty,
      required this.obs})
      : super(key: key);

  @override
  _EditingScreenState createState() => _EditingScreenState(name, evaluationType, dateTime, difficulty, obs);
}

class _EditingScreenState extends State<EditingScreen> {
  final formKey = GlobalKey<FormState>();

  String name;
  final nameController = TextEditingController();

  String type;
  String selectedType = "";
  final evaluationTypes = ['Frequência', 'Mini-Teste', 'Projeto', 'Defesa'];

  String difficulty;
  final difficultyController = TextEditingController();

  DateTime date;

  DateTime? selectedDate;
  final format = DateFormat('yyyy-MM-dd HH:mm');
  final dateTimeController = TextEditingController();

  String obs;
  final obsController = TextEditingController();

  _EditingScreenState(this.name, this.type, this.date, this.difficulty, this.obs);

  @override
  void initState() {
    super.initState();
    nameController.text = name;
    selectedType = type;
    difficultyController.text = difficulty;
    obsController.text = obs;

    nameController.addListener(() => setState(() {}));
    difficultyController.addListener(() => setState(() {}));
    obsController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Edição do Registo")),
        body: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.all(32),
            children: [
              buildName(),
              const SizedBox(height: 24),
              buildType(),
              const SizedBox(height: 24),
              buildDateTime(),
              const SizedBox(height: 24),
              buildDifficulty(),
              const SizedBox(height: 24),
              buildObservations(),
              const SizedBox(height: 24),
              buildEditar()
            ],
          ),
        ));
  }

  Widget buildName() => TextFormField(
        controller: nameController,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.school),
            suffixIcon: nameController.text.isEmpty
                ? Container(width: 0)
                : IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => nameController.clear(),
                  ),
            border: OutlineInputBorder()),
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Obrigatório';
          } else {
            return null;
          }
        },
      );

  Widget buildType() => DropdownButtonFormField(
        value: type,
        items: evaluationTypes
            .map((e) => DropdownMenuItem(child: Text(e), value: e))
            .toList(),
        onChanged: (val) {
          setState(() {
            selectedType = val as String;
          });
        },
        decoration: InputDecoration(
            labelText: 'Tipo de Avaliação',
            prefixIcon: Icon(Icons.type_specimen),
            border: OutlineInputBorder()),
      );

  Widget buildDateTime() => DateTimeFormField(
        initialValue: date,
        dateFormat: format,
        use24hFormat: true,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.schedule),
            border: OutlineInputBorder()),
        onDateSelected: (value) {
          setState(() {
            selectedDate = value;
          });
        },
        validator: (value) {
          if (selectedDate == null) {
            selectedDate = date;
          }
          if (value!.day < DateTime.now().day) {
            return "Não é possível marcar para um dia anterior ao atual";
          }
        },
      );

  Widget buildDifficulty() => TextFormField(
        controller: difficultyController,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.leaderboard),
            suffixIcon: difficultyController.text.isEmpty
                ? Container(width: 0)
                : IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => difficultyController.clear(),
                  ),
            border: OutlineInputBorder()),
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Obrigatório';
          } else if (value != '1' &&
              value != '2' &&
              value != '3' &&
              value != '4' &&
              value != '5') {
            return "Entre 1 a 5";
          } else {
            return null;
          }
        },
      );

  Widget buildObservations() => TextFormField(
        controller: obsController,
        decoration: InputDecoration(
            suffixIcon: obsController.text.isEmpty
                ? Container(width: 0)
                : IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => obsController.clear(),
                  ),
            prefixIcon: Icon(Icons.text_snippet),
            border: OutlineInputBorder()),
        inputFormatters: [LengthLimitingTextInputFormatter(200)],
      );

  Widget buildEditar() => ElevatedButton(
      child: Text("Submeter"),
      onPressed: () {
        final isValid = formKey.currentState!.validate();

        if (isValid) {
          Database.getInstance().edit(nameController.text, selectedType,
              selectedDate!, int.parse(difficultyController.text), obsController.text, name, type, date, int.parse(difficulty), obs);
          final message = "O registo de avaliação selecionado foi editado com sucesso.";
          final snackBar = SnackBar(
            content: Text(message),
            backgroundColor: Colors.green,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(context).pop();
        }
      });
}
