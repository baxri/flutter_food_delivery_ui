import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.account_circle), iconSize: 30, onPressed: () {}),
        title: Text('Food Delivery'),
        actions: [
          FlatButton(
              onPressed: () {},
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
          RecentOrders()
        ],
      ),
    );
  }
}
