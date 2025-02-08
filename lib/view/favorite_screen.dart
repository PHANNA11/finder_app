import 'package:design_ui_app/model/product_model.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favorite.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Stack(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(4),
                    height: 80,
                    width: 80,
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
                  setState(() {
                    favorite[index].isFav = !favorite[index].isFav!;
                    if (favorite[index].isFav == false) {
                      favorite.removeAt(index);
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
                        favorite[index].isFav!
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: favorite[index].isFav!
                            ? Colors.red
                            : Colors.black26,
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
