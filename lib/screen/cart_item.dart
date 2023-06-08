import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/add_to_cart.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<AddCartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Cart Item")),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: cartProvider.cartItem.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Item ${index.toString()}"),
                      leading: const Icon(Icons.shop),
                      trailing: Icon(cartProvider.cartItem.contains(index)
                          ? Icons.shopping_cart
                          : Icons.shopping_cart_outlined),
                      onTap: () {
                        if (cartProvider.cartItem.contains(index)) {
                          cartProvider.removeItem(index);
                        } else {
                          cartProvider.addItem(index);
                        }
                      },
                    );
                  }))
        ],
      ),
    );
  }
}
