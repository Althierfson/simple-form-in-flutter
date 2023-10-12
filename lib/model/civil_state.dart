class MaritalStatus {
  final String name;

  MaritalStatus(this.name);

  static MaritalStatus single = MaritalStatus("Single");
  static MaritalStatus married = MaritalStatus("Married");
  static MaritalStatus divorced = MaritalStatus("Divorced");
  static MaritalStatus widowed = MaritalStatus("Widowed");

  static List<MaritalStatus> get maritalStatusList =>
      [single, married, divorced, widowed];
}
