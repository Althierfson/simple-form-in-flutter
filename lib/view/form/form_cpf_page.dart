import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stages_form/core/format_input/cpf_formatter.dart';
import 'package:stages_form/model/user.dart';
import 'package:stages_form/view/form/form_address_page.dart';

class FormCPFPage extends StatefulWidget {
  final User user;
  const FormCPFPage({super.key, required this.user});

  @override
  State<FormCPFPage> createState() => _FormCPFPageState();
}

class _FormCPFPageState extends State<FormCPFPage> {
  late TextEditingController _cpfController;
  late User user;

  @override
  void initState() {
    user = widget.user;
    _cpfController = TextEditingController(text: user.cpf);
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
                "CPF",
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
                controller: _cpfController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue.shade900, width: 1.0)),
                    errorText: user.cpf != null ? user.checkValidCPF() : null),
                inputFormatters: [CPFFormatter()],
                onChanged: (value) {
                  setState(() {
                    user.cpf = value;
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
                        onPressed: () {
                          Navigator.pop(context, user);
                        },
                        child: const Icon(Icons.arrow_back)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.blue[900]),
                        onPressed: () {
                          if (user.checkValidCPF() != null) {
                            showSnackBar("All data has to be valid");
                          } else {
                            Navigator.push(
                                    context,
                                    PageTransition(
                                        child: FormAddressPage(user: user),
                                        type: PageTransitionType.rightToLeft,
                                        childCurrent: widget,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        reverseDuration:
                                            const Duration(milliseconds: 500)))
                                .then((value) {
                              if (value is User) {
                                user = value;
                                _cpfController.value =
                                    TextEditingValue(text: user.cpf!);
                              }
                            });
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
