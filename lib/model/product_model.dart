class Product {
  int? id;
  String? name;
  String? discountLabel;
  String? image;
  bool? isFav;
  Product({
    required this.id,
    required this.name,
    this.discountLabel,
    this.image,
    this.isFav,
  });
}

List<Product> listProducts = [
  Product(
    isFav: false,
    id: 1001,
    name: 'Justlink 7 in 1 port expansion Dock 7 in 1 hub',
    image:
        'https://s.alicdn.com/@sc04/kf/He57b3df921d84eb9956a8841722ac3b3p.jpg_720x720q50.jpg',
  ),
  Product(
    isFav: true,
    id: 1002,
    name: 'RGB Cushion Wireless Charging Mouse Pad ',
    image:
        'https://s.alicdn.com/@sc04/kf/H3dfb85c0bbca480facca8227a752b79ef.jpg_720x720q50.jpg',
  ),
  Product(
    isFav: true,
    id: 1003,
    name: 'Portable Laptop Stand',
    image:
        'https://s.alicdn.com/@sc04/kf/Heb39a0e1fafe4d948bfdc98f0969a1eaI.jpg_720x720q50.jpg',
  ),
  Product(
    isFav: true,
    id: 1004,
    name: 'K16 PC Keyboard Waterproof Portable Gaming Keyboard Mechanical ',
    image:
        'https://s.alicdn.com/@sc04/kf/H6b7c13cc55284028bc5a931f8cb4bc68f.jpg_720x720q50.jpg',
  ),
  Product(
    isFav: false,
    id: 1005,
    name: 'yenibo wired 63 key RGB backlight Hot swap ',
    image:
        'https://s.alicdn.com/@sc04/kf/H85b920c7f35e4bc7974ad74f3f77389fP.jpg_720x720q50.jpg',
  ),
  Product(
      isFav: false,
      id: 1006,
      name: 'gaming Chair',
      image:
          'https://s.alicdn.com/@sc04/kf/H0d1fe3fb8ea34d8ab90dc734e2d89b4cJ.jpg_720x720q50.jpg',
      discountLabel: '10%-25%'),
];

List<Product> favorite = [];
List<Product> shoppingList = [];
