import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/food.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_stars.dart';

class RestaurantScreen extends StatefulWidget {
  static const routeName = '/restaurant-screen';

  final Restaurant restaurant;

  RestaurantScreen(this.restaurant);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  Widget _buildMenuItem(BuildContext context, Food food) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(food.imageUrl), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15)),
        ),
        Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.3)
                  ]),
              borderRadius: BorderRadius.circular(15)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(food.name,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            Text('\$${food.price.toString()}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ))
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image.asset(
                  widget.restaurant.imageUrl,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.of(context).pop()),
                    IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                        ),
                        iconSize: 30,
                        onPressed: () {}),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.restaurant.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '0.2 miles away',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                RatingStars(widget.restaurant.rating),
                SizedBox(
                  height: 6,
                ),
                Text(
                  widget.restaurant.address,
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {},
                  child: Text(
                    'Reviews',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
              SizedBox(
                width: 15,
              ),
              FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {},
                  child: Text(
                    'Contact',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ))
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Menu',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10),
              crossAxisCount: 2,
              children: List.generate(widget.restaurant.menu.length, (index) {
                Food food = widget.restaurant.menu[index];
                return _buildMenuItem(context, food);
              }),
            ),
          )
        ],
      ),
    );
  }
}
