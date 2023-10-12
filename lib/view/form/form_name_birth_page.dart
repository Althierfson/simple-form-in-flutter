import 'package:flutter/material.dart';
import 'package:stages_form/core/format_input/birth_formatter.dart';
import 'package:stages_form/core/format_input/name_formatter.dart';
import 'package:stages_form/model/user.dart';
import 'package:stages_form/view/form/form_cpf_page.dart';

class FormNameBirthPage extends StatefulWidget {
  const FormNameBirthPage({super.key});

  @override
  State<FormNameBirthPage> createState() => _FormNameBirthPageState();
}

class _FormNameBirthPageState extends State<FormNameBirthPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  late User user;

  @override
  void initState() {
    user = User();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 100.0),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Full Name",
                style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
                textAlign: TextAlign.left,
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue.shade900,
                            width: 1.0)),
                    errorText:
                        user.fullName != null ? user.checkValidName() : null),
                inputFormatters: [NameFormatter()],
                onChanged: (value) {
                  setState(() {
                    user.fullName = value;
                  });
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Birth",
                style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
                textAlign: TextAlign.left,
              ),
              const Text(
                "Only put numbers",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 10.0),
                textAlign: TextAlign.left,
              ),
              TextField(
                controller: _birthController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue.shade900,
                            width: 1.0)),
                    errorText:
                        user.birth != null ? user.checkValidBirth() : null),
                inputFormatters: [BirthFormatter()],
                onChanged: (value) {
                  setState(() {
                    user.birth = value;
                  });
                },
              ),
              const SizedBox(
                height: 150.0,
              ),
              Container(
                height: 100.0,
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.blue[900]),
                        onPressed: () {},
                        child: const Icon(Icons.arrow_back)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.blue[900]),
                        onPressed: () {
                          if (user.checkValidName() != null ||
                              user.checkValidBirth() != null) {
                            showSnackBar("All Data has to be valid!");
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => FormCPFPage(user: user)));
                          }
                        },
                        child: const Icon(Icons.arrow_forward))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
