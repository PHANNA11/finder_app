import 'package:flutter/material.dart';

import '../model/product_model.dart';

// ignore: must_be_immutable
class ProductDetail extends StatefulWidget {
  ProductDetail({super.key, required this.product});
  Product? product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    // final maxHeigth = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('PRODUCT DETAIL'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              transitionOnUserGestures: true,
              tag: widget.product!.id.toString(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                // height: maxHeigth / 2,
                // width: double.infinity,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.product!.image.toString(),
                  ),
                ),
              ),
            ),
            Text(
              widget.product!.name!,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ 24.00",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  widget.product!.discountLabel ?? '',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 228, 88, 88),
                      fontSize: 16),
                ),
              ],
            ),
            Text(
              widget.product!.image.toString(),
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(8),
        height: 60,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                size: 30,
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 50,
              width: maxWidth - (maxWidth / 3.5),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color.fromARGB(255, 13, 32, 207),
                    Colors.red
                  ]),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          shoppingList.add(widget.product!);
                        });
                      },
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                  VerticalDivider(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
