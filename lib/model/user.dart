// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:stages_form/model/address.dart';
import 'package:stages_form/model/civil_state.dart';
import 'package:stages_form/model/type_of_music.dart';
import 'package:stages_form/model/type_of_sport.dart';

class User {
  String? fullName;
  String? birth;
  String? cpf;
  Address? address;

  List<TypeOfMusic>? typeOfMusic;
  List<TypeOfSport>? typeOfSport;
  MaritalStatus? maritalStatus;
  // Did you graduate from high school?
  bool? hasHigherEducation;
  String? collageName;
  String? graduationYear;

  User({
    this.fullName,
    this.birth,
    this.cpf,
    this.address,
    this.typeOfMusic,
    this.typeOfSport,
    this.maritalStatus,
    this.hasHigherEducation,
    this.collageName,
    this.graduationYear,
  });

  String? checkValidName() {
    if (fullName == null || fullName!.length < 10) {
      return "Name to shoot for a full name";
    }
    return null;
  }

  String? checkValidBirth() {
    if (birth == null || birth!.length < 8 || birth!.length > 8) {
      return "Format birth error. DD/MM/YY";
    }
    return null;
  }

  String? checkValidCPF() {
    if (cpf == null || cpf!.length < 14) {
      return "Format CPF error. xxx.xxx.xxx-xx";
    }
    return null;
  }

  String checkValidAddress() {
    if (address == null) {
      return "You should put a Address";
    }
    return "";
  }

  String? checkValidTypeOfMusic() {
    if (typeOfMusic == null || typeOfMusic!.isEmpty) {
      return "You have to select minus 1 item";
    }
    if (typeOfMusic!.length > 3) {
      return "You can only select 3 itens";
    }
    return null;
  }

  String? checkValidTypeOfSport() {
    if (typeOfSport == null || typeOfSport!.isEmpty) {
      return "You have to select minus 1 item";
    }
    if (typeOfSport!.length > 3) {
      return "You can only select 3 itens";
    }
    return null;
  }

  String? checkValidMaritalStatus() {
    if (maritalStatus == null) {
      return "You have to say you're graduation";
    }
    return null;
  }

  String? checkValidCollegeName() {
    if (collageName == null || collageName!.isEmpty) {
      return "You have to say you're College Name";
    }
    return null;
  }

  String? checkValidGraduationYear() {
    if (graduationYear == null || graduationYear!.isEmpty) {
      return "You have to say you're graduation year";
    }
    return null;
  }
}
