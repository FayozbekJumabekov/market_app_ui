import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_app_ui/models/productModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ["All", "Red", "Blue", "Green", "White", "Black"];
  int _selectedIndex = 0;
  List<Product> products = List.generate(
      20,
      (index) => Product(
          name: "PDP Car",
          model: "Electric",
          image: "assets/images/im_car${index % 4}.jpg",
          cost: "${(index+1)* 100}\$",
          isLiked: false));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Cars",
            style: TextStyle(color: Colors.deepOrange),
          ),
          centerTitle: false,
          actions: [
            Icon(
              Icons.notifications_none,
              color: Colors.deepOrange,
            ),
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.shopping_cart,
              color: Colors.deepOrange,
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
                              });
                            },
                            child: Text(
                              categories[index],
                              style:
                                  TextStyle(color: (_selectedIndex == index)
                                      ? Colors.white
                                      : Colors.black, fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: !(_selectedIndex == index)
                                    ? Colors.white
                                    : Colors.deepOrange,
                                shape: StadiumBorder()),
                          ));
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
                    return GridTile(
                      header: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridTileBar(
                          title: Row(
                            children: [
                              Text(products[index].name,style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                              SizedBox(width: 20,),
                              Text(products[index].model,style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),)
                            ],
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(products[index].cost,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                      footer: GridTileBar(
                        leading: Container(
                          margin: EdgeInsets.only(left: 8,bottom: 10),
                          alignment: Alignment.center,
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.red
                          ),
                          child:  Icon(Icons.favorite_border_outlined)
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
                  })
            ],
          ),
        ));
  }
}
