import 'package:design_ui_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ShoppingsScreen extends StatefulWidget {
  const ShoppingsScreen({super.key});

  @override
  State<ShoppingsScreen> createState() => _ShoppingsScreenState();
}

class _ShoppingsScreenState extends State<ShoppingsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shoppingList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Slidable(
          key: const ValueKey(0),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: null,
            children: [
              SlidableAction(
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(10)),
                onPressed: (context) {},
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
              SlidableAction(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(10)),
                onPressed: (context) {},
                backgroundColor: Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.share,
                label: 'Share',
              ),
            ],
          ),
          child: Stack(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(4),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            listProducts[index].image!,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listProducts[index].name!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '\$15.00',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   favorite[index].isFav = !favorite[index].isFav!;
                    //   if (favorite[index].isFav == false) {
                    //     favorite.removeAt(index);
                    //   }
                    // });
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
                          shoppingList[index].isFav!
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: shoppingList[index].isFav!
                              ? Colors.red
                              : Colors.black26,
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
