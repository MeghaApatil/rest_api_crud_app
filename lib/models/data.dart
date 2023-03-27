
import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
    Data({
        required this.title,
        required this.description,
        required this.isCompleted,
    });

    final String title;
    final String description;
    final bool isCompleted;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"],
        description: json["description"],
        isCompleted: json["is_completed"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "is_completed": isCompleted,
    };
}
