import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:date_field/date_field.dart';
import 'package:mini_projeto/data/database.dart';

class RegistrationScreen extends StatefulWidget {
  final String title;

  RegistrationScreen({Key? key, required this.title}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  String selectedType = "";
  final evaluationTypes = ['Frequência', 'Mini-Teste', 'Projeto', 'Defesa'];

  final difficultyController = TextEditingController();

  DateTime now = DateTime.now();
  DateTime? selectedDate;
  final format = DateFormat('yyyy-MM-dd HH:mm');
  final dateTimeController = TextEditingController();

  final obsController = TextEditingController();

  _RegistrationScreenState() {
    selectedType = evaluationTypes[0];
  }

  @override
  void initState() {
    super.initState();
    nameController.addListener(() => setState(() {}));
    difficultyController.addListener(() => setState(() {}));
    obsController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
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
            buildSubmit()
          ],
        ),
      )
    );
  }

  Widget buildName() => TextFormField(
    controller: nameController,
    decoration: InputDecoration(
        labelText: 'Nome da Disciplina',
        prefixIcon: Icon(Icons.school),
        suffixIcon: nameController.text.isEmpty ? Container(width: 0) : IconButton(
          icon: Icon(Icons.close),
          onPressed: () => nameController.clear(),
        ),
        border: OutlineInputBorder()
    ),
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
    value: selectedType,
    items: evaluationTypes.map((e) => DropdownMenuItem(child: Text(e), value: e)).toList(),
    onChanged: (val) {
      setState(() {
        selectedType = val as String;
      });
    },
    decoration: InputDecoration(
        labelText: 'Tipo de Avaliação',
        prefixIcon: Icon(Icons.type_specimen),
        border: OutlineInputBorder()
    ),
  );

  Widget buildDateTime() => DateTimeFormField(
    initialValue: now,
    dateFormat: format,
    use24hFormat: true,
    decoration: InputDecoration(
        prefixIcon: Icon(Icons.schedule),
        border: OutlineInputBorder()
    ),
      onDateSelected: (value) {
        setState(() {
          selectedDate = value;
        });
      },
    validator: (value) {
      if (selectedDate == null) {
        return "Obrigatório selecionar uma data";
      }
      if (value!.day < DateTime.now().day) {
        return "Não é possível marcar para um dia anterior ao atual";
      }
    },
  );

  Widget buildDifficulty() => TextFormField(
    controller: difficultyController,
    decoration: InputDecoration(
        labelText: 'Nível de Dificuldade',
        prefixIcon: Icon(Icons.leaderboard),
        suffixIcon: difficultyController.text.isEmpty ? Container(width: 0) : IconButton(
          icon: Icon(Icons.close),
          onPressed: () => difficultyController.clear(),
        ),
        border: OutlineInputBorder()
    ),
    keyboardType: TextInputType.number,
    inputFormatters: [
      LengthLimitingTextInputFormatter(1)
    ],
    textInputAction: TextInputAction.done,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Obrigatório';
      } else if (value != '1' && value != '2' && value != '3' && value != '4' && value != '5') {
        return "Entre 1 a 5";
      } else {
        return null;
      }
    },
  );

  Widget buildObservations() => TextFormField(
    controller: obsController,
      decoration: InputDecoration(
          labelText: 'Observações',
          suffixIcon: obsController.text.isEmpty ? Container(width: 0) : IconButton(
            icon: Icon(Icons.close),
            onPressed: () => obsController.clear(),
          ),
          prefixIcon: Icon(Icons.text_snippet),
          border: OutlineInputBorder()
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(200)
      ],
  );

  Widget buildSubmit() => ElevatedButton(
      child: Text("Submeter"),
      onPressed: () {
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          Database.getInstance().insert(nameController.text, selectedType, selectedDate!, int.parse(difficultyController.text), obsController.text);
          final message = "A avaliação foi registada com sucesso.";
          final snackBar = SnackBar(
            content: Text(message),
            backgroundColor: Colors.green,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          nameController.clear();
          difficultyController.clear();
          obsController.clear();
        }
    }
  );
}
