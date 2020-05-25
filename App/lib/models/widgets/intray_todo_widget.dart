import 'package:App/models/global.dart';
import 'package:flutter/material.dart';

class IntrayTodo extends StatelessWidget {
  final String title;
  const IntrayTodo({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(
        bottom: 15,
        left: 10,
        right: 10,
      ),
      height: 100,
      decoration: BoxDecoration(
        color: redColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          new BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Row(children: <Widget>[
        Radio(
          groupValue: null,
          onChanged: (Null value) {},
          value: null,
        ),
        Column(
          children: <Widget>[
            Text(
              title,
              style: darkTodoTitle,
            ),
          ],
        )
      ]),
    );
  }
}

// class CustomWidget extends StatelessWidget {
//   final String customWidgetString;
//   final Key key;
//   const CustomWidget({this.key, this.customWidgetString}) : super(key: key);
//   Widget _widget() {
//     return Text(
//       customWidgetString,
//       key: key,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _widget();
//   }
// }

// class AppState extends State {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Reorderable List"),
//       ),
//       body: ReorderableListView(
//         scrollDirection: Axis.vertical,
//         children: [
//           CustomWidget(
//             key: ValueKey("Custom Widget"),
//             customWidgetString: "Custom Widget",
//           )
//         ],
//         onReorder: (a, b) {},
//       ),
//     );
//   }
// }
