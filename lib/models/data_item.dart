// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_api_app/models/item.dart';

DataItem dataFromJson(String str) => DataItem.fromJson(json.decode(str));

String dataToJson(DataItem data) => json.encode(data.toJson());

class DataItem {
    DataItem({
        required this.code,
        required this.success,
        required this.timestamp,
        required this.message,
        required this.items,
    });

    final int code;
    final bool success;
    final int timestamp;
    final String message;
    final List<Item> items;

    factory DataItem.fromJson(Map<dynamic, dynamic> json) => DataItem(
        code: json["code"],
        success: json["success"],
        timestamp: json["timestamp"],
        message: json["message"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "timestamp": timestamp,
        "message": message,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}


