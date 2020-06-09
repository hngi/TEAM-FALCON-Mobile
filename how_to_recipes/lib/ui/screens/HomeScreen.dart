import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:how_to_recipes/ui/screens/widgets/search_bar.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          SafeArea(
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
                    child: Row(
                      
                      children: <Widget>[
                    Text(
                      "Hi John Doe",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontWeight: FontWeight.w500, fontFamily: 'DMSans',color: Color(0xFF1D1754)),
          
                    ),
                    SizedBox(width: 100),
                     SvgPicture.asset(
                            "assets/images/Settings.svg",
                            height: 40.0,
                            width: 40.0,
                            
                          ),
                      ]
                    ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: size.width * .6, // it just take 60% of total width
                      child: Text(
                        "let's get cooking",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'DMSans',

                      color: Colors.black54,
                    ),                      ),
                    ),
                    SizedBox(
                      width: size.width * .9, // it just take the 50% width
                      child: SearchBar(),
                    ),
                    Wrap(
                      spacing: 0,
                      runSpacing: 20,
                      children: <Widget>[
                        
                        SessionCard(
                          isDone: true,
                          press: () {},
                        ),
                    Material(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                child: ClipRRect(
                                  child: Image.asset('assets/images/Saved.png',
                                      width: 300.0, height: 200.0),
                                ),),
                            )
                        )


                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {

  final bool isDone;
  final Function press;
  const SessionCard({
    Key key,
    this.isDone = false,
    this.press,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
         
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  children: <Widget>[
                    Center(
            child: new Image.asset(
              'assets/images/New.png',
              width: 300,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),

                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
