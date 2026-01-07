import 'package:ecommerce_app/models/shoes.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // list of items in the shop
  List<Shoe> shoeShop = [
    Shoe(
      name: "Air Force",
      price: "115",
      imagePath: 'lib/images/airforce.png',
      description:
          "Comfortable, durable and timeless — it is number one for a reason.",
    ),
    Shoe(
      name: "Air Jordan",
      price: "150",
      imagePath: 'lib/images/airjordan.png',
      description: "smooth, patient… dangerous.",
    ),
    Shoe(
      name: "Air Max",
      price: "80",
      imagePath: 'lib/images/airmax.png',
      description: "Unbelievable comfort with fast-paced style.",
    ),
    Shoe(
      name: "Dunk",
      price: "100",
      imagePath: 'lib/images/dunk.png',
      description: "You can always count on a classic.",
    ),
  ];

  // list of items in the cart
  List<Shoe> userCart = [];

  // get the list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get the card
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to the card
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove items to the card
  void removeItemToCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
