import 'package:ecommerce_app/components/shoe_tile.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/shoes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void addShoeToCart(Shoe shoe) {
      Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("${shoe.name} added successfully"),
          content: Text("Check your cart"),
        ),
      );
    }

    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Column(
            children: [
              //search bar
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.only(left: 24, right: 24, top: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text("Search", style: TextStyle(color: Colors.grey)),
                    Icon(Icons.search, color: Colors.grey),
                  ],
                ),
              ),

              SizedBox(height: 24),

              // message
              Text(
                "Everyone flies... some fly longer than others",
                style: TextStyle(color: Colors.grey),
              ),

              SizedBox(height: 24),

              // hot picks
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Hot Picks 🔥",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("See all", style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),

              SizedBox(height: 12),

              //shoes card list
              SizedBox(
                height: 340,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  scrollDirection: Axis.horizontal,
                  itemCount: value.getShoeList().length,
                  itemBuilder: (context, index) {
                    Shoe shoe = value.getShoeList()[index];

                    return ShoeTile(
                      shoe: shoe,
                      onTap: () => addShoeToCart(shoe),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 24);
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Divider(color: Colors.grey[300]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
