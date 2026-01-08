import 'package:ecommerce_app/components/cart_tile.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/shoes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void deleteShoeFromCart(Shoe shoe) {
      Provider.of<Cart>(context, listen: false).removeItemToCart(shoe);
    }

    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 12),
                child: Text(
                  "My Cart",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              //list of shoes added to the cart
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(bottom: 24),
                  itemCount: value.getUserCart().length,
                  itemBuilder: (context, index) {
                    Shoe indexShoe = value.getUserCart()[index];
                    return CartTile(
                      shoe: indexShoe,
                      onPressed: () => deleteShoeFromCart(indexShoe),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 12);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
