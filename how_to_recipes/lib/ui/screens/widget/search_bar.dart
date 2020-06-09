import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(10.5),
      ),
      child: TextField(
        style: TextStyle(fontSize: 14, fontFamily: 'DMSans'),
        decoration: InputDecoration(
          hintText: "search your recipes",
          
          icon: SvgPicture.asset("assets/icons/search.svg"),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
