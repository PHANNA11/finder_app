class ProductBrandModel {
  int? id;
  String? name;
  String? image;
  ProductBrandModel({required this.id, this.image, this.name});
}

List<ProductBrandModel> listProductsBrand = [
  ProductBrandModel(
    id: 1,
    name: 'Aula',
    image: 'https://www.dafont.com/forum/attach/orig/8/7/877730.png',
  ),
  ProductBrandModel(
    id: 2,
    name: 'Logitech',
    image:
        'https://1000logos.net/wp-content/uploads/2020/05/Logitech-Symbol.png',
  ),
  ProductBrandModel(
    id: 3,
    name: 'Xiaomi',
    image:
        'https://instantlogodesign.com/blog/wp-content/uploads/2022/04/Old-Xiaomi-logo-1.jpg',
  ),
  ProductBrandModel(
    id: 4,
    name: 'LG',
    image:
        'https://i.pinimg.com/736x/08/75/36/087536c5fd0ee3ddf9f2eb48afc03620.jpg',
  ),
  ProductBrandModel(
    id: 5,
    name: 'Apple',
    image: 'https://1000logos.net/wp-content/uploads/2016/10/Apple-Logo.jpg',
  ),
];
