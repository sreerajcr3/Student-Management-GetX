class StudentModel {
 final int? id;
 final String name;
 final String domain;
 final String batch;
 final String? image;

  StudentModel(
      {required this.id,
      required this.name,
      required this.domain,
      required this.batch,
      required this.image});

  factory StudentModel.fromMap(Map<String, dynamic> json) {
    return StudentModel(
        id: json["id"],
        name: json["name"],
        domain: json["domain"],
        batch: json["batch"],
        image: json["image"],);
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "domain": domain,
      "batch": batch,
      "image": image
    };
  }
}
