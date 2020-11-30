import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/screens/cart_screen.dart';
import 'package:flutter_food_delivery_ui/screens/restaurant_screen.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_stars.dart';
import 'package:flutter_food_delivery_ui/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildRestaurants(context) {
    List<Widget> restaurantsWidgets = restaurants
        .map((e) => GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => RestaurantScreen(e))),
              child: Container(
                height: 120,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.grey[200]),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Hero(
                        tag: e.imageUrl,
                        child: Image.asset(
                          e.imageUrl,
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                e.name,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              RatingStars(e.rating),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                e.address,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                '0.2 miles away',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ))
        .toList();

    return Column(
      children: restaurantsWidgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.account_circle), iconSize: 30, onPressed: () {}),
        title: Text('Food Delivery'),
        actions: [
          FlatButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => CartScreen())),
              child: Text(
                'Card (5)',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
        ],
      ),
      body: ListView(
        children: [
          // TO style text inputs we most of all using input decoration attribute
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.8),
                      borderRadius: BorderRadius.circular(30)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 0.8, color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(30)),
                  hintText: 'Search Food or Restaurants',
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  suffixIcon:
                      IconButton(icon: Icon(Icons.clear), onPressed: () {})),
            ),
          ),
          RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Nearby Restaurants',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2),
                ),
              ),
              _buildRestaurants(context),
            ],
          )
        ],
      ),
    );
  }
}
