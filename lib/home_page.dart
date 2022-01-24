import 'package:flutter/material.dart';
import 'package:market_app_ui/models/productModel.dart';
import 'package:market_app_ui/shop_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ["All", "Red", "Blue", "Green", "White", "Black"];
  int _selectedIndex = 0;
  String selectedCategory = "Red";
  int countItems = 0;
  List<Product> products = [
    Product(
        name: "PDP Car",
        model: "Electric",
        image: "assets/images/im_car0.jpg",
        cost: "350\$",
        isLiked: false,
        color: "Red"),
    Product(
        name: "PDP Car",
        model: "Electric",
        image: "assets/images/im_car1.jpg",
        cost: "120\$",
        isLiked: false,
        color: "Blue"),
    Product(
        name: "PDP Car",
        model: "Electric",
        image: "assets/images/im_car2.jpg",
        cost: "420\$",
        isLiked: false,
        color: "Yellow"),
    Product(
        name: "PDP Car",
        model: "Electric",
        image: "assets/images/im_car3.jpg",
        cost: "500\$",
        isLiked: false,
        color: "Grey"),
    Product(
        name: "PDP Car",
        model: "Electric",
        image: "assets/images/im_car4.jpg",
        cost: "200\$",
        isLiked: false,
        color: "Green"),
    Product(
        name: "PDP Car",
        model: "Electric",
        image: "assets/images/im_car0.jpg",
        cost: "1200\$",
        isLiked: false,
        color: "Red"),
    Product(
        name: "PDP Car",
        model: "Electric",
        image: "assets/images/im_car1.jpg",
        cost: "670\$",
        isLiked: false,
        color: "Blue"),
    Product(
        name: "PDP Car",
        model: "Electric",
        image: "assets/images/im_car2.jpg",
        cost: "150\$",
        isLiked: false,
        color: "Yellow"),
    Product(
        name: "PDP Car",
        model: "Electric",
        image: "assets/images/im_car3.jpg",
        cost: "1500\$",
        isLiked: false,
        color: "Grey"),
    Product(
        name: "PDP Car",
        model: "Electric",
        image: "assets/images/im_car4.jpg",
        cost: "1800\$",
        isLiked: false,
        color: "Green"),
    Product(
        name: "PDP Car",
        model: "Electric",
        image: "assets/images/im_car0.jpg",
        cost: "720\$",
        isLiked: false,
        color: "Red"),
    Product(
        name: "PDP Car",
        model: "Electric",
        image: "assets/images/im_car1.jpg",
        cost: "Free\$",
        isLiked: false,
        color: "Blue"),
    Product(
        name: "PDP Car",
        model: "Electric",
        image: "assets/images/im_car4.jpg",
        cost: "100\$",
        isLiked: false,
        color: "Green"),
  ];
  List<Product> favourites = [];


  void _openShoppingCart() async {
    List<Product> result = await Navigator.of(context).push( MaterialPageRoute (
      builder: (BuildContext context) => ShoppingCart(favourites),
    ),);
    setState(() {
      countItems = result.length;
    });
    for (int i = 0; i < products.length; i++) {
      if (!result.contains(products[i])) {
        setState(() {
          products[i].isLiked = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Cars",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: Icon(
              Icons.notifications_none,
            ),
            color: Colors.black,
          ),
          IconButton(
            onPressed: (){

              setState(() {
                _openShoppingCart();
              });

            },
            icon: (countItems == 0)
                ? Icon(
                    Icons.shopping_cart,
                  )
                : Icon(
                    Icons.add_shopping_cart,
                    color: Colors.deepOrange,
                  ),
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return buildContainer(index);
                  }),
            ),
            GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: products.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 20,
                  crossAxisCount: 1,
                ),
                itemBuilder: (context, index) {
                  return  buildGridTile(index) ;
                })
          ],
        ),
      ),
      floatingActionButton: (countItems != 0)
          ? FloatingActionButton(
              backgroundColor: Colors.deepOrange,
              onPressed: () {
               setState(() {
                 _openShoppingCart();

               });
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("+$countItems"), Icon(Icons.shopping_cart)],
                ),
              ),
            )
          : null,
    );
  }

  Container buildContainer(int index) {
    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _selectedIndex = index;
                            selectedCategory =categories[index];
                          });
                        },
                        child: Text(
                          categories[index],
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: !(_selectedIndex == index)
                                ? Colors.white
                                : Colors.grey.shade300,
                            shape: StadiumBorder()),
                      ));
  }

  GridTile buildGridTile(int index) {
    return GridTile(
                  header: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridTileBar(
                      title: Text(
                        products[index].name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          products[index].model,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      trailing: Container(
                          alignment: Alignment.center,
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.red),
                          child: IconButton(
                              padding: EdgeInsets.only(bottom: 0),
                              onPressed: () {
                                setState(() {
                                  products[index].isLiked =
                                      !products[index].isLiked;
                                  products[index].isLiked
                                      ? countItems++
                                      : countItems--;
                                  (products[index].isLiked)
                                      ? favourites.add(products[index])
                                      : favourites.remove(products[index]);
                                });
                              },
                              icon: (products[index].isLiked)
                                  ? Icon(Icons.shopping_cart)
                                  : Icon(Icons.shopping_cart_outlined))),
                    ),
                  ),
                  footer: GridTileBar(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        products[index].cost,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(products[index].image))),
                  ),
                );
  }
}
