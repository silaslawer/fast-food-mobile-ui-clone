import 'package:fastfoodmobile/models/category.dart';
import 'package:fastfoodmobile/models/food.dart';
import 'package:fastfoodmobile/pages/food_details.dart';
import 'package:fastfoodmobile/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Category> categories = [
    Category(
        title: 'DAIRY',
        poster: 'images/categories/dairy.png',
        accentColor: UIColors.yellow),
    Category(
        title: 'BAKERY',
        poster: 'images/categories/bakery.png',
        accentColor: UIColors.pink),
    Category(
        title: 'SNACKS',
        poster: 'images/categories/snack.png',
        accentColor: UIColors.lightBlue),
    Category(
        title: 'SEAFOODS',
        poster: 'images/categories/seafood.png',
        accentColor: UIColors.lightPink)
  ];


  List<Category> foodCategoryTags = [
    Category(
        title: 'Milk',
        accentColor: UIColors.yellow),
    Category(
        title: 'Bread',
        accentColor: UIColors.pink),
    Category(
        title: 'Juice',
        accentColor: UIColors.green.withOpacity(0.5)),
  ];

  List<Food> foods = [
    Food(
        name: 'Morning Breakfast',
        image: 'images/foods/breakfast.png',
        description:
            "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        price: 20.00),

    Food(
        name: 'Lunch Food',
        image: 'images/foods/lunch.jpg',
        description:
        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        price: 45.00),

    Food(
        name: 'Supper Food',
        image: 'images/foods/supper.png',
        description:
        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        price: 20.00),
  ];

    @override
    void initState() {
      super.initState();

    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Find Your Best choice",
                        style:
                            TextStyle(color: UIColors.lightBlack, fontSize: 15),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Nutrition Meal",
                        style: TextStyle(
                            color: UIColors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      image: DecorationImage(
                          image: AssetImage(
                            "images/profile/profile_pic.png",
                          ),
                          fit: BoxFit.contain)),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            child: TextField(
              style: TextStyle(),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: UIColors.lightBlack,
                        size: 25,
                      ),
                      onPressed: () {}),
                  filled: true,
                  fillColor: UIColors.lightGrey1,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: UIColors.lightGrey1, width: 5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: UIColors.lightGrey1, width: 5.0),
                  ),
                  hintText: 'Search Foods',
                  hintStyle: TextStyle(color: UIColors.lightBlack)),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, bottom: 10),
            alignment: Alignment.topLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ...categories.map((c) => Expanded(child: categoryCard(context, c))).toList(),
              ],
            ),
          ),
          Container(
            height: 500,
            width: double.infinity,
            margin: EdgeInsets.only(top: 15, bottom: 10),
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 450),
                  ...foods.map((f) => foodCard(context, f)).toList(),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget categoryCard(BuildContext context, Category category) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 90,
            height: 110,
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(right: 7.5, left: 7.5),
            decoration: BoxDecoration(
              color: category.accentColor,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Center(
              child: Image.asset(
                category.poster,fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            category.title,
            style: TextStyle(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ))
        ],
      ),
    );
  }

  Widget foodCard(BuildContext context, Food food) {
    return GestureDetector(
        onTap: () {
         Navigator.push(context, CupertinoPageRoute(builder: (context) => FoodDetails(food)));
        },
        child: Container(
          width: 300,
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Stack(children: <Widget>[
            Container(
              height: 350,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.all(Radius.circular(16)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(food.image),
                  //CachedNetworkImageProvider(movie.poster),
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.05),
                    BlendMode.multiply,
                  ),
                ),

              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 300.0, left: 10.0, right: 10.0, bottom: 30.0),
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 5.0,
                color: Colors.white,
                child: Container(padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        food.name,
                        style: TextStyle(color: UIColors.black,fontWeight: FontWeight.w600,fontSize: 22),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("\$\ ${food.price}",style: TextStyle(color: UIColors.red,fontWeight: FontWeight.w600,fontSize: 17),),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                         Icon(Icons.star,color: UIColors.red,),
                         Icon(Icons.star,color: UIColors.red,),
                         Icon(Icons.star,color: UIColors.red,),
                         Icon(Icons.star,color: UIColors.red,),
                         Icon(Icons.star,color: UIColors.grey,),
                          ],
                        ),
                      ),
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 15),
                        alignment: Alignment.topLeft,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ...foodCategoryTags.map((c) => foodCategoryChip(context, c)).toList(),
                            ],
                          ),
                        ),)
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ));
  }

  Widget foodCategoryChip(BuildContext context, Category category) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.topCenter,
            width: 80,
            margin: EdgeInsets.only(right: 7.5, ),
            decoration: BoxDecoration(
              color: category.accentColor,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Center(
              child: Text(
                category.title,style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
