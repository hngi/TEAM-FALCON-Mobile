//import 'package:flutter/material.dart';
//import 'package:how_to_recipes/ui/ui_helper.dart';
//import 'package:how_to_recipes/viewmodels/add_recipe_vm.dart';
//import 'package:provider/provider.dart';
//import 'package:stacked/stacked.dart';

// class AddTaskSheet extends StatefulWidget {
//   @override
//   _AddTaskSheetState createState() => _AddTaskSheetState();
// }

// class _AddTaskSheetState extends State<AddTaskSheet> {
//   @override
//   Widget build(BuildContext context) {
//     final model = Provider.of<AddRecipeVM>(context);
//     return Container(
//       color: Color(0xFF757575),
//       child: Form(
//         key: model.formKey,
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topRight: Radius.circular(20.0),
//               topLeft: Radius.circular(20.0),
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Text(
//                 'Add Step',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 25.0, color: Constants.kcolor3),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: model.numberController,
//                 keyboardType: TextInputType.number,
//                 validator: (s) =>
//                     model.validateTextField(model.numberController.text),
//                 decoration: Constants.kinputBorder
//                     .copyWith(hintText: 'Step number e.g 1,2,3'),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: model.descController,
//                 validator: (s) =>
//                     model.validateTextField(model.descController.text),
//                 decoration: Constants.kinputBorder
//                     .copyWith(hintText: 'Enter Step Details'),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               FlatButton(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15)),
//                 color: Constants.kcolor3,
//                 onPressed: () {
//                   if (!model.formKey.currentState.validate()) return;
//                   model.addWidgets();
//                   Navigator.pop(context);
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     'Add',
//                     style: TextStyle(fontSize: 25.0, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
