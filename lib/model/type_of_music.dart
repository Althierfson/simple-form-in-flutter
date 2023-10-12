class TypeOfMusic {
  final String name;

  TypeOfMusic(this.name);

  static TypeOfMusic rock = TypeOfMusic("Rock");
  static TypeOfMusic jazz = TypeOfMusic("Jazz");
  static TypeOfMusic classic = TypeOfMusic("Classical music");
  static TypeOfMusic hiphop = TypeOfMusic("Hip Hop");
  static TypeOfMusic blues = TypeOfMusic("Blues");
  static TypeOfMusic metal = TypeOfMusic("Metal");
  static TypeOfMusic popular = TypeOfMusic("Popular music");
  static TypeOfMusic reggae = TypeOfMusic("Reggae");
  static TypeOfMusic country = TypeOfMusic("Country");
  static TypeOfMusic electro = TypeOfMusic("Electro");

  static List<TypeOfMusic> get musicTypeList => [
        rock,
        jazz,
        classic,
        hiphop,
        blues,
        metal,
        popular,
        reggae,
        country,
        electro
      ];
}
