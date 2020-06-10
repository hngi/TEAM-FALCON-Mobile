import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:how_to_recipes/ui/screens/widget/search_bar.dart';
import 'package:how_to_recipes/ui/ui_helper.dart';
import 'package:how_to_recipes/viewmodels/home_screen_vm.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<HomeScreenVM>.reactive(
      viewModelBuilder: () => HomeScreenVM(),
      onModelReady: (model) => model.init(),
      builder: (context, model, _) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  SizedBox(
                    width: size.width * .95, // it just take 60% of total width
                    child: Row(children: <Widget>[
                      Expanded(
                        child: Text(
                          "Hi, ${model.name}",
                          style: Theme.of(context).textTheme.display1.copyWith(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'DMSans',
                              color: Color(0xFF1D1754)),
                        ),
                      ),
                      SizedBox(width: 100),
                      // SvgPicture.asset(
                      //   "assets/images/Settings.svg",
                      //   height: 40.0,
                      //   width: 40.0,
                      // ),
                    ]),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: size.width * .6, // it just take 60% of total width
                    child: Text(
                      "let's get cooking",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'DMSans',
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SizedBox(height :15),
                  // SizedBox(
                  //   width: size.width * .9, // it just take the 50% width
                  //   child: SearchBar(),
                  // ),
                  MyCards(
                    heading: "New Recipe",
                    subHeading:
                        'Create a Step by Step list of your favourite foods',
                    color: Constants.kdarkOrange,
                    image: 'assets/images/chef1.png',
                    tap: () => model.newRecipe(),
                  ),
                  SizedBox(height: 16),
                  MyCards(
                    heading: "Saved Recipes",
                    subHeading: 'View your saved recipes, all in one place',
                    color: Constants.kcolor1,
                    image: 'assets/images/chef2.png',
                    tap: () => model.savedRecipe(),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCards extends StatelessWidget {
  final String heading;
  final String subHeading;
  final String image;
  final Color color;
  final Function tap;
  const MyCards({
    Key key,
    this.heading,
    this.subHeading,
    this.image,
    this.color,
    this.tap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: tap,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 16, left: 16, right: 100),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      heading,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'DMSans',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      subHeading,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'DMSans',
                        color: Colors.white,
                      ),
                    ),
                  ]),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 16),
                child: Image(
                  image: AssetImage(image),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Text(
//                       "New Recipe",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontFamily: 'DMSans',
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     Text(
//                       "Create a Step by Step list of your favourite foods",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontFamily: 'DMSans',
//                         color: Colors.white,
//                       ),
//                     ),
//                   ]),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 16),
//             child: Image(
//               image: AssetImage('assets/images/chef1.png'),
//             ),
