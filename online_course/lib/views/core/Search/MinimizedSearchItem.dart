import "package:flutter/material.dart";
import "package:online_course/containers/CourseContainer.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MinimizedSearchItem extends StatelessWidget {
  final CourseContainer courseContainer;

  MinimizedSearchItem({Key? key, required this.courseContainer})
      : super(key: key) {
    print(this.courseContainer);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: Image.network(
                  this.courseContainer.imageUrl,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: EdgeInsets.fromLTRB(5, 2, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(this.courseContainer.title,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(height: 2),
                    Text(this.courseContainer.instructorUserName,
                        style: TextStyle(color: Colors.grey[500])),
                    Row(
                      children: [
                        RatingBar.builder(
                          ignoreGestures: true,
                          initialRating:
                              this.courseContainer.ratedNumber.toDouble(),
                          itemSize: 17,
                          itemBuilder: (contexPt, _) =>
                              Icon(Icons.star, color: Colors.yellowAccent),
                          onRatingUpdate: (updatedStar) =>
                              {print("updated start $updatedStar")},
                          unratedColor: Colors.grey[800],
                        ),
                        Text(
                          "(Đã bán: ${this.courseContainer.soldNumber})",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              //fontFamily: "Fira",
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                    Text(
                      "đ${this.courseContainer.price}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Fira",
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
