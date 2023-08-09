import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cartmodel.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int itemcount = 1;

  // void _increment() {
  //   itemcount++;
  // }

  // void _decrement() {
  //   itemcount--;
  // }

  @override
  Widget build(BuildContext context) {
    final cart = context
        .watch<CartProvider>()
        .cart; // same stuff as below just smaller syntax
    // final cart = (Provider.of<CartProvider>(context).cart);
    return Scaffold(
      body: cart.isEmpty
          ? const Center(
              child: Text(
              "Your Cart is Empty",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Divider(),
                          );
                        },
                        padding: const EdgeInsets.all(16),
                        itemCount: cart.length,
                        itemBuilder: (context, index) {
                          final cartItem = cart[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: SizedBox(
                                height: 100,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          cartItem['imageID'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cartItem['title'],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            "Size: ${cartItem['size']}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            cartItem['price'],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // const SizedBox(
                                    //   width: 80,
                                    // ),
                                    const Spacer(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  barrierDismissible: false,
                                                  context: (context),
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                        "Delete Product",
                                                        style: TextStyle(
                                                            fontSize: 18),
                                                      ),
                                                      content: const Text(
                                                        "Are you Sure you want to delete the product from your Cart?",
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: const Text(
                                                                "No")),
                                                        TextButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                Provider.of<CartProvider>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .removeProduct(
                                                                        cartItem);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              });
                                                            },
                                                            child: const Text(
                                                                "Yes")),
                                                      ],
                                                    );
                                                  });
                                            },
                                            icon: const Icon(
                                              size: 35,
                                              Icons.delete,
                                              color: Colors.red,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "hello",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "\$ 68",
                                style: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 120,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  backgroundColor:
                                      Color.fromARGB(255, 43, 42, 43)),
                              onPressed: () {},
                              child: Text(
                                "Pay Now",
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
