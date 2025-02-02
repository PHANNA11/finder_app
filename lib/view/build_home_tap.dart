import 'package:design_ui_app/model/product_brand_model.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';

class BuildHomeTapScreen extends StatelessWidget {
  const BuildHomeTapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(4),
      child: Column(
        children: [
          builCategory(),
          builFeatureList(title: 'Top Selling', list: listProducts),
          builFeatureList(
              title: 'Discount', list: listProducts, showDiscount: true),
          builFeatureList(title: 'Nearly', list: listProducts),
        ],
      ),
    );
  }

  Widget builCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category BRAND',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listProductsBrand.length,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.all(4),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(listProductsBrand[index].image!))),
            ),
          ),
        ),
      ],
    );
  }

  Widget builFeatureList(
      {String title = 'Feature',
      required List<Product>? list,
      bool showDiscount = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'View all',
              style: TextStyle(),
            ),
          ],
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list!.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Stack(
                      children: [
                        Container(
                          width: 280,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 150,
                                width: 280,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.lightBlue,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage(list[index].image!))),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Text(
                                      list[index].name!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Text(
                                    ' \$45.00',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        if (list[index].discountLabel != null && showDiscount)
                          Positioned(
                              child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.yellowAccent,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(list[index].discountLabel!),
                            ),
                          ))
                      ],
                    ),
                  )),
        ),
      ],
    );
  }
}
