import 'package:fastfoodmobile/models/category.dart';
import 'package:fastfoodmobile/models/food.dart';
import 'package:fastfoodmobile/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodDetails extends StatefulWidget {
  final Food food;

  FoodDetails(this.food);

  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  Food food;

  List<Category> foodCategoryTags = [
    Category(title: 'Milk', accentColor: UIColors.red),
    Category(title: 'Bread', accentColor: UIColors.orange),
    Category(title: 'Juice', accentColor: UIColors.green),
  ];

  List<Category> extraDishes = [
    Category(
      poster: 'images/foods/cereal.png',
    ),
    Category(
      poster: 'images/foods/porridge.png',
    ),
    Category(
      poster: 'images/foods/pancakes.png',
    ),
  ];

  int quantity = 1;

  String selectedPlatform = "Overview";
  List<String> platforms = ["Overview", "Review", "Other"];

  @override
  void initState() {
    super.initState();
    food = widget.food;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Material(
                elevation: 10,
                child: Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      image: DecorationImage(
                          image: AssetImage(food.image), fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: UIColors.white))),
              Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: UIColors.white)))
            ],
          ),
          Material(
            elevation: 2,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    food.name,
                    style: TextStyle(
                        color: UIColors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "\$\ ${food.price}",
                    style: TextStyle(
                        color: UIColors.orange,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 15),
                    alignment: Alignment.topLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ...foodCategoryTags
                            .map((c) => foodCategoryChip(context, c))
                            .toList(),
                        Spacer(),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: UIColors.orange,
                              size: 17,
                            ),
                            Icon(
                              Icons.star,
                              color: UIColors.orange,
                              size: 17,
                            ),
                            Icon(
                              Icons.star,
                              color: UIColors.orange,
                              size: 17,
                            ),
                            Icon(
                              Icons.star,
                              color: UIColors.orange,
                              size: 17,
                            ),
                            Icon(
                              Icons.star,
                              color: UIColors.grey,
                              size: 17,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 70,
            width: double.infinity,
            margin: EdgeInsets.only(top: 15, bottom: 10),
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 90),
                  ...platforms.map((option) {
                    bool active = option == selectedPlatform;
                    // final textColor = active ? Colors.white : Colors.black;
                    return GestureDetector(
                      onTap: () {
                        setState(() => selectedPlatform = option);
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          boxShadow: active
                              ? [
                                  BoxShadow(
                                    color: UIColors.orange.withOpacity(0.4),
                                    offset: Offset(0, 20),
                                    blurRadius: 26,
                                    spreadRadius: -15,
                                  )
                                ]
                              : null,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: 120,
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color:
                                  active ? UIColors.orange : Color(0xFFF0F6F5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: Center(
                            child: Text(
                              option,
                              style: TextStyle(
                                  color:
                                      active ? UIColors.white : UIColors.black),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Food Information",
              style: TextStyle(
                  color: UIColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              food.description,
              style: TextStyle(
                  color: UIColors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 17),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ...extraDishes.map((c) => extraDishCard(context, c)).toList(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        height: height / 8,
        decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: SafeArea(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(
                      Icons.add,
                      color: UIColors.grey,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: UIColors.grey)),
                  ),
                ),
                Container(
                  width: 100,
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Center(child: Text("$quantity")),
                  decoration: BoxDecoration(
                      border: Border.all(color: UIColors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (quantity <= 1) quantity = 1;
                      quantity--;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(
                      Icons.remove,
                      color: UIColors.grey,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: UIColors.grey)),
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              width: 150,
              height: 40,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                  child: Text(
                "ADD TO CART",
                style: TextStyle(color: UIColors.white),
              )),
              decoration: BoxDecoration(
                  color: UIColors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
          ],
        )),
      ),
    );
  }

  Widget foodCategoryChip(BuildContext context, Category category) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 30,
            alignment: Alignment.topCenter,
            width: 70,
            margin: EdgeInsets.only(
              right: 7.5,
            ),
            decoration: BoxDecoration(
              color: category.accentColor,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Center(
              child: Text(
                category.title,
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: UIColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget extraDishCard(BuildContext context, Category category) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 100,
            width: 120,
            margin: EdgeInsets.only(
              right: 7.5,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                image: DecorationImage(
                  image: AssetImage(category.poster),
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
    );
  }
}
