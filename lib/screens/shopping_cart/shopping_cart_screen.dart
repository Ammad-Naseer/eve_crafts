// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:eve_crafts/screens/shopping_cart/components/cart_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Expanded(
                child: PersistentShoppingCart().showCartItems(
                  cartTileWidget: ({required data}) =>
                      CartTileWidget(data: data),
                  showEmptyCartMsgWidget: Center(
                    child: SizedBox(
                      height: size.height * .7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Your cart is empty'),
                          const SizedBox(height: 20),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Shop now')),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              PersistentShoppingCart().showTotalAmountWidget(
                cartTotalAmountWidgetBuilder: (totalAmount) => Visibility(
                  visible: totalAmount == 0.0 ? false : true,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(color: Colors.black, fontSize: 22),
                          ),
                          Text(
                            r"$" + totalAmount.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 22),
                          ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            final shoppingCart = PersistentShoppingCart();

                            // Retrieve cart data and total price
                            Map<String, dynamic> cartData =
                                shoppingCart.getCartData();

                            // Extract cart items and total price
                            List<PersistentShoppingCartItem> cartItems =
                                cartData['cartItems'];
                            double totalPrice = cartData['totalPrice'];

                            /* since cart items is a list, you can run a loop to extract all the values
                                  send it to api or firebase based on your requirement

                             */

                            log('Total Price: $totalPrice');
                          },
                          child: const Text('Checkout'))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
