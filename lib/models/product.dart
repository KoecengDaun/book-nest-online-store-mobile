// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String model;
    int pk;
    Fields fields;

    Product({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String name;
    int price;
    String description;
    String author;
    String genre;
    int publicationYear;
    int stock;
    String isbn;
    dynamic owner;

    Fields({
        required this.name,
        required this.price,
        required this.description,
        required this.author,
        required this.genre,
        required this.publicationYear,
        required this.stock,
        required this.isbn,
        required this.owner,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        price: json["price"],
        description: json["description"],
        author: json["author"],
        genre: json["genre"],
        publicationYear: json["publication_year"],
        stock: json["stock"],
        isbn: json["isbn"],
        owner: json["owner"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "description": description,
        "author": author,
        "genre": genre,
        "publication_year": publicationYear,
        "stock": stock,
        "isbn": isbn,
        "owner": owner,
    };
}
