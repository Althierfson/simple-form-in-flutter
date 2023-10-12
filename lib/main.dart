import 'package:flutter/material.dart';
import 'package:stages_form/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Stages Form',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

/* Just for test 
User(
            fullName: "Ayrton Senna da Silva",
            birth: "21/03/60",
            cpf: "088.090.091.91",
            address: Address(
                address: "Av. Sen",
                district: "Teotônio Vilela",
                number: "261",
                uf: "SP",
                cep: "59360-000",
                city: "São Paulo",
                complement: "Autódromo José Carlos Pace - Interlagos"),
            typeOfMusic: [
              TypeOfMusic.rock,
              TypeOfMusic.metal,
              TypeOfMusic.hiphop,
            ],
            typeOfSport: [
              TypeOfSport.football,
              TypeOfSport.basketball,
              TypeOfSport.golf,
            ],
            maritalStatus: MaritalStatus.single,
            hasHigherEducation: true,
            collageName: "Monaco Circuit",
            graduationYear: "1993"),*/