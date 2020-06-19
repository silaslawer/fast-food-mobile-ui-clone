import 'package:fastfoodmobile/models/category.dart';
import 'package:fastfoodmobile/models/food.dart';
import 'package:fastfoodmobile/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double moviesOpacity = 0;
  double seriesOpacity = 0;
  final fadeDuration = Duration(milliseconds: 200);
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
        name: 'Morning Breakfast',
        image: 'images/foods/supper.png',
        description:
        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        price: 20.00),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 600), () async {
      fadeInWidgets();
    });
  }

  void fadeInWidgets() async {
    await Future.delayed(Duration(milliseconds: 400));
    if (mounted) setState(() => moviesOpacity = 1);
    await Future.delayed(Duration(milliseconds: 400));
    if (mounted) setState(() => seriesOpacity = 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 40),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Find Your Best choice",
                        style:
                            TextStyle(color: UIColors.lightBlack, fontSize: 20),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Nutrition Meal",
                        style: TextStyle(
                            color: UIColors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 70,
                  height: 70,
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
            child: TextField(
              style: TextStyle(),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: UIColors.lightBlack,
                        size: 30,
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
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 15, bottom: 10),
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ...categories.map((c) => categoryCard(context, c)).toList(),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 450,
            width: double.infinity,
            margin: EdgeInsets.only(top: 15, bottom: 10),
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24),
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
            width: 120,
            height: 150,
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(right: 7.5, left: 7.5),
            decoration: BoxDecoration(
              color: category.accentColor,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Center(
              child: Image.asset(
                category.poster,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            category.title,
            textAlign: TextAlign.center,
          ))
        ],
      ),
    );
  }

  Widget foodCard(BuildContext context, Food food) {
    return GestureDetector(
        onTap: () {
        },
        child: Container(
          width: 300,
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(right: 15),
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
                  top: 250.0, left: 20.0, right: 20.0, bottom: 10.0),
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 5.0,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      food.name,
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text("UI/UX designer | Foodie | Kathmandu"),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      height: 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              title: Text(
                                "302",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text("Posts".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12.0)),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                "10.3K",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text("Followers".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12.0)),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                "120",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text("Following".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12.0)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
