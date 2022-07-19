class Project {
  String name;
  int year;
  String description;
  String imageUrl;
  List<String>? technolgiesUsed;

  Project(
      {required this.name,
      required this.description,
      required this.year,
      required this.imageUrl,
      this.technolgiesUsed});
}
