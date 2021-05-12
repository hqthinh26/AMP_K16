import "package:flutter/material.dart";
import "package:online_course/containers/CourseContainer.dart";

class MinimizedSearchItem extends StatelessWidget {
  final CourseContainer courseContainer;

  MinimizedSearchItem({Key? key, required this.courseContainer})
      : super(key: key) {
    print(this.courseContainer);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            child: Image.network(
              this.courseContainer.imageUrl,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Text(this.courseContainer.description,
              style: TextStyle(color: Colors.white)),
        )
      ],
    ));
  }
}
