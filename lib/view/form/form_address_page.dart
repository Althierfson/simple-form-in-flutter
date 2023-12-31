import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stages_form/core/format_input/cep_formatter.dart';
import 'package:stages_form/core/repositories/uf_repositories.dart';
import 'package:stages_form/model/address.dart';
import 'package:stages_form/model/user.dart';
import 'package:stages_form/view/form/form_preferences_page.dart';

class FormAddressPage extends StatefulWidget {
  final User user;
  const FormAddressPage({super.key, required this.user});

  @override
  State<FormAddressPage> createState() => _FormAddressPageState();
}

class _FormAddressPageState extends State<FormAddressPage> {
  final UFRepositories ufRepositories = UFRepositories();
  final Color blue = Colors.blue[900] as Color;

  late Map<String, TextEditingController> _editingControllerList;

  late Address address;
  late User user;

  @override
  void initState() {
    user = widget.user;
    address = widget.user.address ?? Address();
    _createEditingControllerList();
    super.initState();
  }

  _createEditingControllerList() {
    _editingControllerList = {
      "address": TextEditingController(text: address.address),
      "district": TextEditingController(text: address.district),
      "city": TextEditingController(text: address.city),
      "uf": TextEditingController(text: address.uf),
      "cep": TextEditingController(text: address.cep),
      "number": TextEditingController(text: address.number),
      "complement": TextEditingController(text: address.complement),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Address",
                style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
                textAlign: TextAlign.left,
              ),
              TextField(
                controller: _editingControllerList["address"],
                decoration: InputDecoration(
                    hintText: "Address",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue.shade900, width: 1.0)),
                    errorText: address.address != null
                        ? address.checkValidAddress()
                        : null),
                onChanged: (value) {
                  setState(() {
                    address.address = value;
                  });
                },
              ),
              TextField(
                controller: _editingControllerList["district"],
                decoration: InputDecoration(
                    hintText: "District",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue.shade900, width: 1.0)),
                    errorText: address.district != null
                        ? address.checkValidDistrict()
                        : null),
                onChanged: (value) {
                  setState(() {
                    address.district = value;
                  });
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: _editingControllerList["city"],
                      decoration: InputDecoration(
                          hintText: "City",
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue.shade900, width: 1.0)),
                          errorText: address.city != null
                              ? address.checkValidCity()
                              : null),
                      onChanged: (value) {
                        setState(() {
                          address.city = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 9.0),
                    child: DropdownButton(
                        iconEnabledColor: Colors.blue,
                        underline:
                            Container(height: 1, color: Colors.blue.shade900),
                        isExpanded: true,
                        value: address.uf,
                        items: List.generate(
                          ufRepositories.ufs.length,
                          (index) => DropdownMenuItem(
                            value: ufRepositories.ufs[index],
                            child: Text(
                              ufRepositories.ufs[index],
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            address.uf = value;
                          });
                        }),
                  ))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _editingControllerList["cep"],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "CEP",
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue.shade900, width: 1.0)),
                          errorText: address.cep != null
                              ? address.checkValidCEP()
                              : null),
                      inputFormatters: [CEPFormatter()],
                      onChanged: (value) {
                        setState(() {
                          address.cep = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 50.0,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _editingControllerList["number"],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Number",
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue.shade900, width: 1.0)),
                          errorText: address.number != null
                              ? address.checkValidNumber()
                              : null),
                      onChanged: (value) {
                        setState(() {
                          address.number = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              TextField(
                controller: _editingControllerList["complement"],
                decoration: InputDecoration(
                    hintText: "Complement",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue.shade900, width: 1.0)),
                    errorText: address.complement != null
                        ? address.checkValidComplement()
                        : null),
                onChanged: (value) {
                  setState(() {
                    address.complement = value;
                  });
                },
              ),
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
                            user.address = address;
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
                              widget.user.address = address;
                              Navigator.push(
                                      context,
                                      PageTransition(
                                          child:
                                              FormPreferencesPage(user: user),
                                          type: PageTransitionType.rightToLeft,
                                          childCurrent: widget,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          reverseDuration: const Duration(
                                              milliseconds: 500)))
                                  .then((value) {
                                if (value is User) {
                                  user = value;
                                  address = value.address!;
                                  _createEditingControllerList();
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
      ),
    );
  }

  void showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  bool validData() {
    return address.checkValidAddress() != null &&
        address.checkValidDistrict() != null &&
        address.checkValidCEP() != null &&
        address.checkValidCity() != null &&
        address.checkValidNumber() != null &&
        address.checkValidUF() != null &&
        address.checkValidComplement() != null;
  }
}
