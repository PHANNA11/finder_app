import 'package:design_ui_app/model/product_brand_model.dart';
import 'package:design_ui_app/view/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../model/product_model.dart';

class BuildHomeTapScreen extends StatefulWidget {
  const BuildHomeTapScreen({super.key});

  @override
  State<BuildHomeTapScreen> createState() => _BuildHomeTapScreenState();
}

class _BuildHomeTapScreenState extends State<BuildHomeTapScreen> {
  bool isFav = false;
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
                    child: GestureDetector(
                      onTap: () {
                        PersistentNavBarNavigator.pushDynamicScreen(
                          context,
                          screen: CupertinoPageRoute(
                            builder: (context) => ProductDetail(
                              product: list[index],
                            ),
                          ),
                          withNavBar: false,
                        );
                      },
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
                                Hero(
                                  transitionOnUserGestures: true,
                                  tag: 'aa',
                                  child: Container(
                                    height: 150,
                                    width: 280,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.lightBlue,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                list[index].image!))),
                                  ),
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
                              ),
                            ),
                          Positioned(
                            right: 5,
                            top: 5,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  list[index].isFav = !list[index].isFav!;
                                  if (list[index].isFav == true) {
                                    favorite.add(list[index]);
                                  }
                                });
                              },
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      list[index].isFav!
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      color: list[index].isFav!
                                          ? Colors.red
                                          : Colors.black26,
                                    ),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
        ),
      ],
    );
  }
}
