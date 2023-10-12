class TypeOfSport {
  final String name;

  TypeOfSport(this.name);

  static TypeOfSport football = TypeOfSport("Football");
  static TypeOfSport badminton = TypeOfSport("Badminton");
  static TypeOfSport fieldHockey = TypeOfSport("Field Hockey");
  static TypeOfSport volleyball = TypeOfSport("Volleyball");
  static TypeOfSport basketball = TypeOfSport("Basketball");
  static TypeOfSport tennis = TypeOfSport("Tennis");
  static TypeOfSport cricket = TypeOfSport("Cricket");
  static TypeOfSport tableTennis = TypeOfSport("Table Tennis");
  static TypeOfSport baseball = TypeOfSport("Baseball");
  static TypeOfSport golf = TypeOfSport("Golf");

  static List<TypeOfSport> get sportTypeList => [
        football,
        badminton,
        fieldHockey,
        volleyball,
        basketball,
        tennis,
        cricket,
        tableTennis,
        baseball,
        golf
      ];
}
