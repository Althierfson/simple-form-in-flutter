class Address {
  String? district;
  String? address;
  String? number;
  String? uf;
  String? cep;
  String? city;
  String? complement;

  Address(
      {this.district,
      this.address,
      this.number,
      this.uf,
      this.cep,
      this.city,
      this.complement});

  String get fullAddress =>
      "$address, $number - $district, $city - $uf, $cep, $complement";

  String? checkValidDistrict() {
    if (district == null || district!.isEmpty) {
      return "You Have to add a discrict";
    }
    return null;
  }

  String? checkValidAddress() {
    if (address == null || address!.isEmpty) {
      return "You Have to add a address";
    }
    return null;
  }

  String? checkValidNumber() {
    if (number == null || number!.isEmpty) {
      return "You Have to add a number";
    }
    return null;
  }

  String? checkValidUF() {
    if (uf == null || uf!.isEmpty) {
      return "You Have to add a uf";
    }
    if (uf!.length > 2) {
      return "UF only can have 2 letters";
    }
    return null;
  }

  String? checkValidCEP() {
    if (cep == null || cep!.isEmpty) {
      return "You Have to add a discrict";
    }
    if (cep!.length != 9) {
      return "Formatter erro. xxxxx-xxx";
    }
    return null;
  }

  String? checkValidCity() {
    if (city == null || city!.isEmpty) {
      return "You Have to add a city";
    }
    return null;
  }

  String? checkValidComplement() {
    if (complement == null || complement!.isEmpty) {
      return "You Have to add a complement";
    }
    return null;
  }
}
