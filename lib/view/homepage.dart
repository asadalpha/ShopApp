import 'package:flutter/material.dart';
import 'package:shopping_app/view/cart_page.dart';
import 'package:shopping_app/view/product_page.dart';
import 'package:shopping_app/view/profile_page.dart';
import 'package:shopping_app/view/wishlist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentpage = 0;
  int currentIndex = 0;
  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.shopping_cart,
    Icons.person_rounded,
  ];

  List<Widget> pages = const [
    ProductPage(),
    WishList(),
    CartPage(),
    Profilepage()
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(20),
          height: size.width * .155,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.15),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(50),
          ),
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: size.width * .024),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(
                  () {
                    currentIndex = index;
                    currentpage = index;
                  },
                );
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(
                      bottom: index == currentIndex ? 0 : size.width * .029,
                      right: size.width * .0422,
                      left: size.width * .0422,
                    ),
                    width: size.width * .128,
                    height: index == currentIndex ? size.width * .014 : 0,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 43, 42, 43),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                  ),
                  Icon(
                    listOfIcons[index],
                    size: size.width * .076,
                    color: index == currentIndex
                        ? const Color.fromARGB(255, 43, 42, 43)
                        : Colors.black38,
                  ),
                  SizedBox(height: size.width * .03),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              //color: Colors.pink,
              size: 24,
            ),
          ),
          centerTitle: true,
          title: const Text(
            "Hello,Amy",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage("assets/girl.jpg"),
                ))
          ],
        ),
        body: pages[currentpage]);
  }
}

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.txt,
      required this.color1,
      required this.color2,
      required this.fun});
  final String txt;
  final Color color1;
  final Color color2;
  final Function fun;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: color1, backgroundColor: color2),
      onPressed: () {
        fun;
      },
      child: Text(txt),
    );
  }
}
