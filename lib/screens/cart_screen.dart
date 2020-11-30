import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class CartScreen extends StatelessWidget {
  Widget _buildCartItem(Order cart) => Container(
        height: 170,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      cart.food.imageUrl,
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cart.food.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                          cart.restaurant.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 100,
                          child: TextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(5),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                      borderRadius: BorderRadius.circular(30)),
                                  prefixIcon: Container(
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.add,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                      maxWidth: 20, maxHeight: 20),
                                  suffixIconConstraints: BoxConstraints(
                                      maxWidth: 20, maxHeight: 20),
                                  suffixIcon: Container(
                                    child: GestureDetector(
                                      child: Icon(
                                        Icons.add,
                                        size: 15,
                                      ),
                                      onTap: () {},
                                    ),
                                  ))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Text(cart.food.price.toString())
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart(${currentUser.cart.length})'),
      ),
      body: ListView.separated(
          itemBuilder: (context, i) => _buildCartItem(currentUser.cart[i]),
          separatorBuilder: (context, i) => Divider(
                height: 1,
                color: Colors.grey,
              ),
          itemCount: currentUser.cart.length),
    );
  }
}
