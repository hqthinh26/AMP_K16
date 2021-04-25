import 'package:flutter/material.dart';
import 'package:online_course/services/Category.dart';

class Entry {
  final String title;
  Entry(this.title);
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  Widget _buildTiles(Entry root) {
    return ListTile(
      title: Text(root.title),
      onTap: () => {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

class CourseCategory extends StatefulWidget {
  @override
  _CourseCategoryState createState() => _CourseCategoryState();
}

class _CourseCategoryState extends State<CourseCategory> {
  List<Entry> data = <Entry>[];

  Future<void> getCategories() async {
    Category category = Category();
    List<dynamic> data = await category.getAllCategories();
    setState(
        () => {this.data = data.map((item) => Entry(item["name"])).toList()});
  }

  @override
  void initState() {
    super.initState();
    this.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Expanded(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) =>
                    EntryItem(data[index]))));
  }
}
