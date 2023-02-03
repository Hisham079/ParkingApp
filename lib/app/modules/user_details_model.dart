// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

//UserDetails productFromJson(String str) => UserDetails.fromJson(json.decode(str));

String productToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
    UserDetails({
        this.id,
        this.fname,
        this.lname,
        this.email,
        this.age,
    });

    String? id;
    String? fname;
    String? lname;
    String? email;
    String? age;

    factory UserDetails.fromJson(Map<String, String> json) => UserDetails(
        id: json["id"],
        fname: json["fname"],
        lname: json["lname"],
        email: json["email"],
        age: json["age"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fname": fname,
        "lname": lname,
        "email": email,
        "age": age,
    };
}
