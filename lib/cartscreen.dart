import 'package:flutter/material.dart';

import 'modelprodeuctdetails.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Cart"),
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(listCart.length, (index) {
          model_productdata data = listCart[index];
          return Center(
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black12)),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey,
                      ),
                      Text(
                        data.productname,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        data.price.toString(),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  listCart[index].quantity--;
                                });
                              },
                              icon: Icon(Icons.minimize_outlined)),
                          Text(
                            data.quantity.toString(),
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  listCart[index].quantity++;
                                });
                              },
                              icon: Icon(Icons.add))
                        ],
                      ),
                      Text(
                        "total :${listCart[index].quantity * data.price}",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  Positioned(
                    top: 2,
                    right: 2,
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            listCart.remove(data);
                          });
                        },
                        child: Text("remove from cart")),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
