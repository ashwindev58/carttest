import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cartscreen.dart';
import 'modelprodeuctdetails.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            icon: Icon(CupertinoIcons.cart))
      ]),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(listProducts.length, (index) {
          model_productdata data = listProducts[index];
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
                                  listProducts[index].quantity--;
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
                                  listProducts[index].quantity++;
                                });
                              },
                              icon: Icon(Icons.add))
                        ],
                      ),
                      Text(
                        "total :${listProducts[index].quantity * data.price}",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  Positioned(
                    top: 2,
                    right: 2,
                    child: TextButton(
                        onPressed: () {
                          listCart.add(data);
                        },
                        child: Text("Add to cart")),
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
