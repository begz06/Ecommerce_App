class EcommerceEntity {
  final String? image;
  final String? title;
  final String? description;
  final String? currencySymbol;
  final int? price;
  final int? rating;

  const EcommerceEntity({
    this.title,
    this.image,
    this.currencySymbol,
    this.description,
    this.rating,
    this.price,
  });
}
