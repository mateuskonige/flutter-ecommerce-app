import 'package:ecommerce_app/models/shoes.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  Shoe shoe;
  Function()? onPressed;
  CartTile({Key? key, required this.shoe, required this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: SizedBox(width: 64, child: Image.asset(shoe.imagePath)),
        title: Text(shoe.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(shoe.price),
        trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.delete, color: Colors.red),
        ),
      ),
    );
  }
}
