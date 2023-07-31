class UserModel {
  final int id;
  final String title;
  final int image;
  final String category;
  final String price;
  final String desc;

  UserModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.category,
      required this.price,
      required this.desc});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        category: json['category'],
        price: json['price'],
        desc: json['desc']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['category'] = category;
    data['price'] = price;
    data['desc'] = desc;

    return data;
  }
}
