import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:market_app_ui/models/productModel.dart';

class ShoppingCart extends StatefulWidget {
  final List<Product> favoriteItems;
  static final String id = "shop_cart";

  const ShoppingCart(this.favoriteItems, {Key? key}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context,widget.favoriteItems);
          },
          icon:Icon(Icons.arrow_back,),
          color: Colors.black,
        ),
        title: Text(
          "My Cart",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 35,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: (widget.favoriteItems.isNotEmpty)
          ? SingleChildScrollView(
              child: Column(children: [
                ListView.builder(
                    padding: EdgeInsets.all(10),
                    shrinkWrap: true,
                    itemCount: widget.favoriteItems.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Card(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.favoriteItems[index].isLiked =
                                    !widget.favoriteItems[index].isLiked;
                                print(widget.favoriteItems[index].isLiked);
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.all(10),
                                  leading: Text(
                                    (index + 1).toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  title: Text(widget.favoriteItems[index].name),
                                  subtitle:
                                      Text(widget.favoriteItems[index].cost),
                                  trailing: Container(
                                    height: 120,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: AssetImage(widget
                                                .favoriteItems[index].image))),
                                  ),

                                  isThreeLine: true,
                                ),
                                (!widget.favoriteItems[index].isLiked)
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Divider(
                                            height: 10,
                                            thickness: 1,
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  widget.favoriteItems
                                                      .removeAt(index);
                                                });
                                              },
                                              icon: Icon(Icons.delete))
                                        ],
                                      )
                                    : SizedBox.shrink()
                              ],
                            ),
                          ),
                        ))
              ]),
            )
          : Center(
              child: Text("No Items !!!"),
            ),
    );
  }
}
