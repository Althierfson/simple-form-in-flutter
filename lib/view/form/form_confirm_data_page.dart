import 'package:flutter/material.dart';
import 'package:stages_form/model/type_of_music.dart';
import 'package:stages_form/model/type_of_sport.dart';
import 'package:stages_form/model/user.dart';
import 'package:stages_form/view/home_page.dart';

class FormConfirmDataPage extends StatefulWidget {
  final User user;
  const FormConfirmDataPage({super.key, required this.user});

  @override
  State<FormConfirmDataPage> createState() => _FormConfirmDataPageState();
}

class _FormConfirmDataPageState extends State<FormConfirmDataPage> {
  late User user;

  @override
  void initState() {
    user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 0.0),
        child: Column(
          children: [
            buildSection("Name and Birth",
                [Text(user.fullName ?? ""), Text(user.birth ?? "")]),
            buildSection("CPF", [Text(user.cpf ?? "")]),
            buildSection("Address", [Text(user.address!.fullAddress)]),
            buildSection("Music and Sport", [
              Text(typeOfMusicString(user.typeOfMusic ?? [])),
              Text(typeOfSportString(user.typeOfSport ?? []))
            ]),
            buildSection("Graduation", [
              Text(user.collageName ?? ""),
              Text(user.graduationYear ?? "")
            ]),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HomePage()));
                },
                child: const Text("New Person"))
          ],
        ),
      ),
    );
  }

  Widget buildSection(String nameSection, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            nameSection,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14.0),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 8.0,
          ),
          for (int i = 0; i < children.length; i++) children[i]
        ]),
      ),
    );
  }

  String typeOfMusicString(List<TypeOfMusic> typeOfMusic) {
    String listString = "";
    for (var e in typeOfMusic) {
      listString = "$listString${e.name} - ";
    }
    return listString.substring(0, listString.length - 2);
  }

  String typeOfSportString(List<TypeOfSport> typeOfSport) {
    String listString = "";
    for (var e in typeOfSport) {
      listString = "$listString${e.name} - ";
    }
    return listString.substring(0, listString.length - 2);
  }
}
