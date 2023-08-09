import 'package:flutter/material.dart';
import 'package:shopping_app/view/product_details.dart';
import '../models/cartmodel.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<String> filters = [
    "All",
    "Trending",
    "Tshirts",
    "Shirts",
    "Jackets"
  ];

  String? selectedfilter;

  @override
  void initState() {
    super.initState();
    selectedfilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                            child: Material(
                              elevation: 4,
                              borderRadius: BorderRadius.circular(16),
                              child: TextField(
                                // showCursor: false,
                                decoration: InputDecoration(
                                    hintText: "Choose your Style",
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 43, 42, 43)),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 43, 42, 43)),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    contentPadding: const EdgeInsets.all(12),
                                    prefixIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.search),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(16))),
                              ),
                            ),
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(16),
                          elevation: 6,
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: const Color.fromARGB(255, 43, 42, 43),
                              ),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.sort,
                                    color: Colors.white,
                                  ))),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Material(
                            borderRadius: BorderRadius.circular(22),
                            elevation: 8,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: const Color.fromARGB(255, 43, 42, 43),
                              ),
                              height: 120,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Text(
                                        'Weekend Sale',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Get Discount upto 50 percent  ',
                                        style: TextStyle(color: Colors.white),
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              centerTitle: true,
            ),
          ),
        ];
      },
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              // 2nd box ends here
              SizedBox(
                height: 40,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filters.length,
                    itemBuilder: (context, index) {
                      final filter = filters[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedfilter = filter;
                            });
                          },
                          child: Chip(
                              backgroundColor: selectedfilter == filter
                                  ? const Color.fromARGB(255, 43, 42, 43)
                                  : Colors.white,
                              label: Text(
                                filter,
                                style: TextStyle(
                                    color: selectedfilter == filter
                                        ? Colors.white
                                        : Colors.black),
                              )),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: shopitems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.5, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final product = shopitems[index];
                      final imagePath = product["imageID"] as String;
                      final itemName = product['title'] as String;
                      final itemPrice = product['price'] as String;
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Column(children: [
                              Material(
                                borderRadius: BorderRadius.circular(35),
                                elevation: 4,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ProductScreen(
                                          imagePath: imagePath,
                                          product: product,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: imagePath,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          image: DecorationImage(
                                              image: AssetImage(imagePath),
                                              fit: BoxFit.cover)),
                                      height: 180,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                            const SizedBox(
                              height: 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        itemName,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        itemPrice,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Padding(
              //     padding: const EdgeInsets.all(12.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         MyButton(
              //             txt: "All",
              //             color1: Colors.white,
              //             color2: const Color.fromARGB(255, 43, 42, 43),
              //             fun: () {}),
              //         const SizedBox(
              //           width: 15,
              //         ),
              //         MyButton(
              //             txt: "Trending",
              //             color1: const Color.fromARGB(255, 43, 42, 43),
              //             color2: Colors.white,
              //             fun: () {}),
              //         const SizedBox(
              //           width: 15,
              //         ),
              //         MyButton(
              //             txt: "Tshirts",
              //             color1: const Color.fromARGB(255, 43, 42, 43),
              //             color2: Colors.white,
              //             fun: () {}),
              //         const SizedBox(
              //           width: 15,
              //         ),
              //         MyButton(
              //             txt: "Lower",
              //             color1: const Color.fromARGB(255, 43, 42, 43),
              //             color2: Colors.white,
              //             fun: () {}),
              //         const SizedBox(
              //           width: 15,
              //         ),
              //         MyButton(
              //             txt: "Example",
              //             color1: const Color.fromARGB(255, 43, 42, 43),
              //             color2: Colors.white,
              //             fun: () {}),
              //         const SizedBox(
              //           width: 15,
              //         ),
              //         MyButton(
              //             txt: "Example",
              //             color1: const Color.fromARGB(255, 43, 42, 43),
              //             color2: Colors.white,
              //             fun: () {}),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
