// To parse this JSON data, do
//
//     final thumbnailModel = thumbnailModelFromMap(jsonString);

import 'dart:convert';

class ThumbnailModel {
    ThumbnailModel({
        this.path,
        this.image_extension,
    });

    String? path;
    String? image_extension;

    factory ThumbnailModel.fromJson(String str) => ThumbnailModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ThumbnailModel.fromMap(Map<String, dynamic> json) => ThumbnailModel(
        path: json["path"],
        image_extension: json["extension"],
    );

    Map<String, dynamic> toMap() => {
        "path": path,
        "extension": image_extension,
    };
}
