import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cartmodel.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen(
      {Key? key, required this.imagePath, required this.product})
      : super(key: key);

  final String imagePath;
  final Map<String, Object> product;

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String? selectedSize = " ";

  void onTap() {
    if (selectedSize != " ") {
      Provider.of<CartProvider>(context, listen: false).addProduct({
        "id": widget.product['id'],
        "title": widget.product['title'],
        "price": widget.product['price'],
        "imageID": widget.product['imageID'],
        "size": selectedSize,
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Product added Successfully")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please Choose Size")));
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(45),
              child: Hero(
                tag: widget.imagePath,
                child: Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage(widget.imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product['title'] as String,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Brand Gucci",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.product['price'] as String,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final size =
                        (widget.product['size'] as List<String>)[index];
                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSize = size;
                          });
                        },
                        child: Chip(
                          backgroundColor: selectedSize == size
                              ? const Color.fromARGB(255, 43, 42, 43)
                              : null,
                          label: Text(
                            size,
                            style: TextStyle(
                                color: selectedSize == size
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    backgroundColor: const Color.fromARGB(255, 43, 42, 43),
                  ),
                  onPressed: onTap,
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
