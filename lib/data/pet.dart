class Pet {
  final String name;
  final String type;
  final String breed;
  final int age;
  final String gender;
  final String color;
  final List<String> vaccinations;
  final String imageUrl;

  Pet({
    required this.name,
    required this.type,
    required this.breed,
    required this.age,
    required this.gender,
    required this.color,
    required this.vaccinations,
    required this.imageUrl,
  });

  Pet copyWith({
    String? name,
    String? type,
    String? breed,
    int? age,
    String? gender,
    String? color,
    List<String>? vaccinations,
    String? imageUrl,
  }) {
    return Pet(
      name: name ?? this.name,
      type: type ?? this.type,
      breed: breed ?? this.breed,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      color: color ?? this.color,
      vaccinations: vaccinations ?? this.vaccinations,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}