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
      title: Text(root.title, style: TextStyle(color: Colors.white)),
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
  List<Widget> listViews = <Widget>[];

  Future<void> getCategories() async {
    Category category = Category();
    List<dynamic> data = await category.getAllCategories();
    setState(() {
      listViews.add(DrawerHeader(child: Text("Danh sách khoá học", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),)));
      data.forEach((item) => listViews.add(EntryItem(Entry(item["name"]))));
    });
  }

  @override
  void initState() {
    super.initState();
    this.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
        child: ListView.builder(
            itemCount: listViews.length,
            itemBuilder: (BuildContext context, int index) =>
                listViews[index]));
  }
}
