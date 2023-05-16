class Product {
  final int? id;
  final String title;
  final String desc;

  Product({
    this.id,
    required this.title,
    required this.desc,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json['id'],
      title: json['title'],
      desc: json['desc']);

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        'title': title,
        'desc': desc,
      };
}
