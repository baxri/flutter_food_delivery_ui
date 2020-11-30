import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class RecentOrders extends StatelessWidget {
  Widget _buildRecentOrder(ctx, Order order) {
    return Container(
      width: 320,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colors.grey[200])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    order.food.imageUrl,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(order.food.name,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          order.restaurant.name,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          order.date,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Theme.of(ctx).primaryColor,
                borderRadius: BorderRadius.circular(24)),
            child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {}),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Recent Orders',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 1.2),
          ),
        ),
        Container(
          height: 120,
          child: ListView.builder(
              // This thins is only for android to make bounceing effect
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders.length,
              itemBuilder: (ctx, i) {
                return _buildRecentOrder(ctx, currentUser.orders[i]);
              }),
        )
      ],
    );
  }
}
