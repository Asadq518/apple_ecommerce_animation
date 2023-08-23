// ignore_for_file: non_constant_identifier_names

class Product {
  final String title, image, id, details;

  Product(
      {required this.title,
      required this.image,
      required this.id,
      required this.details});
}

List<Product> demo_products = [
  Product(
    id: '1',
    details: '128Gb Silver',
    title: "iPhone 11",
    image: "assets/img_1.png",
  ),
  Product(
    id: '2',
    details: '512Gb Gold',
    title: "iPhone 13 Pro",
    image: "assets/img_2.webp",
  ),
  Product(
    id: '3',
    details: '1tb White',
    title: "iPhone 12",
    image: "assets/img_3.png",
  ),
  Product(
    id: '4',
    details: '256Gb Silver',
    title: "iPhone 13 Pro",
    image: "assets/img_4.jpeg",
  ),
  Product(
    id: '5',
    details: '512G Black',
    title: "iPhone 14 Pro",
    image: "assets/img_5.jpeg",
  ),
  Product(
    id: '6',
    details: '512Gb Silver',
    title: "iPhone 14 Pro",
    image: "assets/img_6.jpeg",
  ),
];
