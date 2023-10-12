import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stages_form/model/user.dart';
import 'package:stages_form/view/form/form_confirm_data_page.dart';

class FormGraduationPage extends StatefulWidget {
  final User user;
  const FormGraduationPage({super.key, required this.user});

  @override
  State<FormGraduationPage> createState() => _FormGraduationPageState();
}

class _FormGraduationPageState extends State<FormGraduationPage> {
  late TextEditingController _collegeController;
  late TextEditingController _yearController;

  late User user;

  @override
  void initState() {
    user = widget.user;
    _collegeController = TextEditingController(text: user.collageName);
    _yearController = TextEditingController(text: user.graduationYear);
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
                "Education",
                style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
                textAlign: TextAlign.left,
              ),
              SwitchListTile(
                title: const Text(
                  "Do your have Higher Education?",
                  style: TextStyle(fontSize: 12.0),
                ),
                value: user.hasHigherEducation ?? false,
                onChanged: (value) {
                  setState(() {
                    user.hasHigherEducation = value;
                  });
                },
              ),
              buildGraduationData(),
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
                          if (validData()) {
                            showSnackBar("All data has to be valid");
                          } else {
                            Navigator.push(
                                    context,
                                    PageTransition(
                                        child: FormConfirmDataPage(user: user),
                                        type: PageTransitionType.rightToLeft,
                                        childCurrent: widget,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        reverseDuration:
                                            const Duration(milliseconds: 500)))
                                .then((value) {
                              if (value is User) {
                                user = value;
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

  Widget buildGraduationData() {
    if (user.hasHigherEducation != null && user.hasHigherEducation!) {
      return Column(
        children: [
          TextField(
            controller: _collegeController,
            decoration: InputDecoration(
                hintText: "College Name",
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade900, width: 1.0)),
                errorText: user.collageName != null
                    ? user.checkValidCollegeName()
                    : null),
            onChanged: (value) {
              setState(() {
                user.collageName = value;
              });
            },
          ),
          TextField(
            controller: _yearController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "Graduation Year",
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade900, width: 1.0)),
                errorText: user.graduationYear != null
                    ? user.checkValidGraduationYear()
                    : null),
            onChanged: (value) {
              setState(() {
                user.graduationYear = value;
              });
            },
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  bool validData() {
    if (user.hasHigherEducation == null) return false;
    if (user.hasHigherEducation!) {
      if (user.checkValidCollegeName() != null ||
          user.checkValidGraduationYear() != null) {
        return true;
      }
    }
    return false;
  }
}
