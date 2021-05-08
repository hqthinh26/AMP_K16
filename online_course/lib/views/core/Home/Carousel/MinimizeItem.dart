import "package:flutter/material.dart";
import 'package:online_course/containers/CourseContainer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MinimizeItem extends StatefulWidget {
  //late final Map<String, dynamic> courseInfo;
  late final CourseContainer courseContainer;
  MinimizeItem({Key? key, required this.courseContainer}) : super(key: key);

  @override
  _MinimizeItemState createState() => _MinimizeItemState();
}

class _MinimizeItemState extends State<MinimizeItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            child: Image.network(
              widget.courseContainer.imageUrl,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 5),
                Expanded(
                  flex: 2,
                  child: Text(
                    widget.courseContainer.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: "Fira"),
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                  flex: 2,
                  child: Container(
                    //color: Colors.blue,
                    child: Text(
                      widget.courseContainer.subtitle,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                          fontSize: 13,
                          fontFamily: "Fira"),
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      //color: Colors.red,
                      child: Row(
                        children: [
                          RatingBar.builder(
                              ignoreGestures: true,
                              initialRating:
                                  widget.courseContainer.ratedNumber.toDouble(),
                              itemSize: 17,
                              itemBuilder: (contexPt, _) =>
                                  Icon(Icons.star, color: Colors.amber[200]),
                              onRatingUpdate: (updatedStar) =>
                                  {print("updated start $updatedStar")}),
                          Text(
                            "(Đã bán: ${widget.courseContainer.soldNumber})",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Fira",
                                fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                    )),
                SizedBox(height: 5),
                Expanded(
                    flex: 3,
                    child: Text(
                      "${widget.courseContainer.price}đ",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Fira",
                          fontSize: 18),
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
