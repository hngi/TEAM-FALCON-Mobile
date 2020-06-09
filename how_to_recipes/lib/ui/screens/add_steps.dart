import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:how_to_recipes/ui/screens/widget/add_step_bottom.dart';
import 'package:how_to_recipes/ui/ui_helper.dart';

class AddRecipe extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AddRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Create new recipe",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                DottedBorder(
                  dashPattern: [6, 3, 2, 3],
                  strokeWidth: 2,
                  borderType: BorderType.RRect,
                  color: Constants.korange,
                  radius: Radius.circular(12),
                  padding: EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      height: 212.0,
                      width: double.infinity,
                      child: FlatButton(
                          onPressed: () {},
                          child: Image.asset('assets/images/camera.png')),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Meal Name',
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Meal Description',
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Steps",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return SingleChildScrollView(
                              child: Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: AddTaskSheet(),
                          ));
                        });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Constants.kcolor3,
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      leading: Icon(Icons.add, color: Colors.white),
                      title: Text(
                        'Add new step',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class StepItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Constants.kcolor3, borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Text(
          '1',
          style: TextStyle(color: Colors.white),
        ),
        title: Text(
          'do this',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
