import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/count.dart';
import 'package:shop_app/screen/cart_item.dart';

import '../providers/add_to_cart.dart';
import '../providers/slider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context);
    final sliderProvider = Provider.of<SliderProvider>(context);
    final cartProvider = Provider.of<AddCartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Example"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartItem()));
              },
              icon: const Icon(Icons.shopping_cart_checkout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context, child, value) {
                return SizedBox(
                  height: 55,
                  child: TextField(
                    obscureText: toggle.value,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            toggle.value = !toggle.value;
                          },
                          icon: toggle.value
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility,
                                  color: Colors.indigo),
                        ),
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13))),
                  ),
                );
              }),
          Text(
            countProvider.count.toString(),
            style: const TextStyle(fontSize: 50),
          ),
          Slider(
              min: 0,
              max: 1,
              value: sliderProvider.currentValue,
              onChanged: (newValue) {
                sliderProvider.setValue(newValue);
              }),
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.indigo.withOpacity(sliderProvider.currentValue),
            child: Center(
              child: Text(
                "Magic 😎",
                style: TextStyle(
                    fontSize: 30,
                    color:
                        Colors.black.withOpacity(sliderProvider.currentValue)),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 16,
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
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.increament();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
