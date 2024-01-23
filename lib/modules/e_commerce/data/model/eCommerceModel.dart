import 'package:ecommerce_app_with_tdd/modules/e_commerce/domain/entity/eCommerceEntity.dart';

class EcommerceModel {
  final List<Product> products;

  const EcommerceModel({required this.products});

  factory EcommerceModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> productList = json['products'];
    final List<Product> productsList = productList
        .map((productJson) => Product.fromJson(productJson))
        .toList();
    return EcommerceModel(products: productsList);
  }
}

class Product extends EcommerceEntity {
  final String image;
  final String title;
  final String description;
  final String currencySymbol;
  final int price;
  final int rating;

  Product({
    required this.image,
    required this.title,
    required this.description,
    required this.currencySymbol,
    required this.price,
    required this.rating,
  }) : super(
          image: image,
          title: title,
          description: description,
          currencySymbol: currencySymbol,
          price: price,
          rating: rating,
        );

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      image: json['image'],
      title: json['title'],
      description: json['desc'],
      currencySymbol: json['currency_symbol'],
      price: json['price'],
      rating: json['rating'],
    );
  }
}
