import 'package:App/models/classes/task.dart';
import 'package:App/models/global.dart';
import 'package:App/models/widgets/intray_todo_widget.dart';
import 'package:flutter/material.dart';

class IntrayPage extends StatefulWidget {
  _IntrayPageState createState() => _IntrayPageState();
}

class _IntrayPageState extends State<IntrayPage> {
  List<Task> taskList = getList();

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: 120),
      color: darkGreyColor,
      child: Theme(
        data: ThemeData(
          canvasColor: Colors.transparent,
        ),
        child: _buildReorderableList(context),
      ),
    );
  }

  Widget _buildReorderableList(BuildContext context) {
    return ReorderableListView(
      padding: EdgeInsets.only(top: 300, bottom: 10),
      children:
          taskList.map((Task item) => _buildListTile(context, item)).toList(),
      onReorder: _onReorder,
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      Task item = taskList.removeAt(oldIndex);
      taskList.insert(newIndex, item);
    });
  }

  Widget _buildListTile(BuildContext context, Task item) {
    return new ListTile(
      key: Key(item.taskID),
      title: new IntrayTodo(
        title: item.title,
      ),
    );
  }

  static List<Task> getList() {
    List<Task> list = [];
    for (int i = 0; i < 10; i++) {
      list.add(new Task(
        "Hello " + (i + 1).toString(),
        false,
        (i + 1).toString(),
      ));
    }
    return list;
  }
}
