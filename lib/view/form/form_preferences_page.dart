import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stages_form/model/civil_state.dart';
import 'package:stages_form/model/type_of_music.dart';
import 'package:stages_form/model/type_of_sport.dart';
import 'package:stages_form/model/user.dart';
import 'package:stages_form/view/form/form_graduation_page.dart';

class FormPreferencesPage extends StatefulWidget {
  final User user;
  const FormPreferencesPage({super.key, required this.user});

  @override
  State<FormPreferencesPage> createState() => _FormPreferencesPageState();
}

class _FormPreferencesPageState extends State<FormPreferencesPage> {
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
        padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Music type",
              style: TextStyle(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
              textAlign: TextAlign.left,
            ),
            MultiSelectDialogField(
              initialValue: user.typeOfMusic ?? <TypeOfMusic>[],
              items: TypeOfMusic.musicTypeList
                  .map((e) => MultiSelectItem(e, e.name))
                  .toList(),
              listType: MultiSelectListType.CHIP,
              onConfirm: (list) {
                user.typeOfMusic = list;
              },
              validator: (list) {
                if (user.typeOfMusic != null) {
                  return user.checkValidTypeOfMusic();
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.always,
            ),
            Text(
              "Select Sport Type",
              style: TextStyle(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
              textAlign: TextAlign.left,
            ),
            MultiSelectDialogField(
              initialValue: user.typeOfSport ?? <TypeOfSport>[],
              items: TypeOfSport.sportTypeList
                  .map((e) => MultiSelectItem(e, e.name))
                  .toList(),
              listType: MultiSelectListType.CHIP,
              onConfirm: (list) {
                user.typeOfSport = list;
              },
              validator: (list) {
                if (user.typeOfSport != null) {
                  return user.checkValidTypeOfSport();
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.always,
            ),
            Text(
              "Select marital Status",
              style: TextStyle(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
              textAlign: TextAlign.left,
            ),
            DropdownButton(
                iconEnabledColor: Colors.blue,
                underline: Container(height: 1, color: Colors.blue.shade900),
                isExpanded: true,
                value: user.maritalStatus,
                items: List.generate(
                  MaritalStatus.maritalStatusList.length,
                  (index) => DropdownMenuItem(
                    value: MaritalStatus.maritalStatusList[index],
                    child: Text(
                      MaritalStatus.maritalStatusList[index].name,
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    user.maritalStatus = value;
                  });
                }),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                height: 100.0,
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.blue[900]),
                        onPressed: () {
                          Navigator.pop(context, user);
                        },
                        child: const Icon(Icons.arrow_back)),
                    const SizedBox(
                      width: 50.0,
                    ),
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
                                        child: FormGraduationPage(user: user),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  bool validData() {
    return user.checkValidTypeOfMusic() != null &&
        user.checkValidTypeOfSport() != null &&
        user.checkValidMaritalStatus() != null;
  }
}
