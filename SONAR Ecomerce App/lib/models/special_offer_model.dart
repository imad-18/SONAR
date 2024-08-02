class SpecialOfferModel {
  final String name, imagePath;
  final int number;

  SpecialOfferModel({
    required this.name,
    required this.imagePath,
    required this.number,
  });
}

List<SpecialOfferModel> specialOfferList = [
  SpecialOfferModel(
    name: 'Smartphones',
    number: 18,
    imagePath: 'assets/images/Image Banner 2.png',
  ),
  SpecialOfferModel(
    name: 'Fashion',
    number: 24,
    imagePath: 'assets/images/Image Banner 3.png',
  ),
];
