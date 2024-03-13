// To parse this JSON data, do
//
//     final getAllCategories = getAllCategoriesFromJson(jsonString);

import 'dart:convert';

List<GetAllCategories> getAllCategoriesFromJson(String str) =>
    List<GetAllCategories>.from(
        json.decode(str).map((x) => GetAllCategories.fromJson(x)));

String getAllCategoriesToJson(List<GetAllCategories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllCategories {
  final int? id;
  final String? name;
  final String? slug;
  final int? parent;
  final String? description;
  final String? display;
  final Image? image;
  final int? menuOrder;
  final int? count;
  final Links? links;

  GetAllCategories({
    required this.id,
    required this.name,
    required this.slug,
    required this.parent,
    required this.description,
    required this.display,
    required this.image,
    required this.menuOrder,
    required this.count,
    required this.links,
  });

  factory GetAllCategories.fromJson(Map<String, dynamic> json) =>
      GetAllCategories(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        parent: json["parent"],
        description: json["description"],
        display: json["display"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        menuOrder: json["menu_order"],
        count: json["count"],
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "parent": parent,
        "description": description,
        "display": display,
        "image": image!.toJson(),
        "menu_order": menuOrder,
        "count": count,
        "_links": links!.toJson(),
      };
}

class Image {
  final int? id;
  final DateTime? dateCreated;
  final DateTime? dateCreatedGmt;
  final DateTime? dateModified;
  final DateTime? dateModifiedGmt;
  final String? src;
  final String? name;
  final String? alt;

  Image({
    required this.id,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.src,
    required this.name,
    required this.alt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModified: DateTime.parse(json["date_modified"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        src: json["src"],
        name: json["name"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated!.toIso8601String(),
        "date_created_gmt": dateCreatedGmt!.toIso8601String(),
        "date_modified": dateModified!.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt!.toIso8601String(),
        "src": src,
        "name": name,
        "alt": alt,
      };
}

class Links {
  final List<Collection> self;
  final List<Collection> collection;

  Links({
    required this.self,
    required this.collection,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Collection>.from(
            json["self"].map((x) => Collection.fromJson(x))),
        collection: List<Collection>.from(
            json["collection"].map((x) => Collection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
      };
}

class Collection {
  final String? href;

  Collection({
    required this.href,
  });

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}
