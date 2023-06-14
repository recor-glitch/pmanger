class ProjectEntity {
  final String image;
  final String title;
  final String date;
  final String routine;
  final List<dynamic> steps;

  ProjectEntity({
    required this.image,
    required this.title,
    required this.date,
    required this.routine,
    required this.steps,
  });

  ProjectEntity.fromJson(Map<dynamic, dynamic> json)
      : image = json['image'],
        title = json['title'],
        date = json['date'],
        routine = json['routine'],
        steps = json['steps'];

  ProjectEntity copyWith({
    String? image,
    String? title,
    String? date,
    String? routine,
    List<dynamic>? steps,
  }) =>
      ProjectEntity(
        image: image ?? this.image,
        title: title ?? this.title,
        date: date ?? this.date,
        routine: routine ?? this.routine,
        steps: steps ?? this.steps,
      );
}
