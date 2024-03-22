import 'dart:convert';

MakananModel MakananModelFromJson(String str) => MakananModel.fromJson(json.decode(str));

String MakananModelToJson(MakananModel data) => json.encode(data.toJson());

class MakananModel {
    List<FoodPost> foodPosts;

    MakananModel({
        required this.foodPosts,
    });

    factory MakananModel.fromJson(Map<String, dynamic> json) => MakananModel(
        foodPosts: List<FoodPost>.from(json["foodPosts"].map((x) => FoodPost.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "foodPosts": List<dynamic>.from(foodPosts.map((x) => x.toJson())),
    };
}

class FoodPost {
    String id;
    String userId;
    String title;
    String price;
    String body;
    String pictureLink;
    DateTime createdAt;
    String variant;
    int? numberOfRatings;
    int? averageRating;
    User user;
    dynamic comments;

    FoodPost({
        required this.id,
        required this.userId,
        required this.title,
        required this.price,
        required this.body,
        required this.pictureLink,
        required this.createdAt,
        required this.variant,
        this.numberOfRatings,
        this.averageRating,
        required this.user,
        this.comments,
    });

    factory FoodPost.fromJson(Map<String, dynamic> json) => FoodPost(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        price: json["price"],
        body: json["body"],
        pictureLink: json["pictureLink"],
        createdAt: DateTime.parse(json["createdAt"]),
        variant: json["variant"],
        numberOfRatings: json["numberOfRatings"],
        averageRating: json["averageRating"],
        user: User.fromJson(json["user"]),
        comments: json["comments"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "title": title,
        "price": price,
        "body": body,
        "pictureLink": pictureLink,
        "createdAt": createdAt.toIso8601String(),
        "variant": variant,
        "numberOfRatings": numberOfRatings,
        "averageRating": averageRating,
        "user": user.toJson(),
        "comments": comments,
    };
}

class User {
    String id;
    String username;
    String email;
    String displayName;
    String phoneNumber;
    String address;
    bool isSeller;
    bool isSubscribed;
    DateTime subscribedUntil;
    String profilePhotoLink;

    User({
        required this.id,
        required this.username,
        required this.email,
        required this.displayName,
        required this.phoneNumber,
        required this.address,
        required this.isSeller,
        required this.isSubscribed,
        required this.subscribedUntil,
        required this.profilePhotoLink,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        displayName: json["displayName"],
        phoneNumber: json["phoneNumber"],
        address: json["Address"],
        isSeller: json["isSeller"],
        isSubscribed: json["isSubscribed"],
        subscribedUntil: DateTime.parse(json["subscribedUntil"]),
        profilePhotoLink: json["profilePhotoLink"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "displayName": displayName,
        "phoneNumber": phoneNumber,
        "Address": address,
        "isSeller": isSeller,
        "isSubscribed": isSubscribed,
        "subscribedUntil": subscribedUntil.toIso8601String(),
        "profilePhotoLink": profilePhotoLink,
    };
}
