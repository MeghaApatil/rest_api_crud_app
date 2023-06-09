class Item {
    Item({
        required this.id,
        required this.title,
        required this.description,
        required this.isCompleted,
        required this.createdAt,
        required this.updatedAt,
    });

    final String id;
    final String title;
    final String description;
    final bool isCompleted;
    final DateTime createdAt;
    final DateTime updatedAt;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        isCompleted: json["is_completed"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "is_completed": isCompleted,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}