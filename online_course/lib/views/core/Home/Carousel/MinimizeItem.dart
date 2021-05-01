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
                Expanded(
                  flex: 1,
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
                Expanded(
                  flex: 1,
                  child: Text(
                    widget.courseContainer.subtitle,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Fira"),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: RatingBar.builder(
                        ignoreGestures: true,
                        initialRating:
                            widget.courseContainer.ratedNumber.toDouble(),
                        itemSize: 17,
                        itemBuilder: (contexPt, _) =>
                            Icon(Icons.star, color: Colors.amber[200]),
                        onRatingUpdate: (updatedStar) =>
                            {print("updated start $updatedStar")})),
                Expanded(
                    flex: 1,
                    child: Text(
                      "(${widget.courseContainer.soldNumber})",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Fira"),
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      "${widget.courseContainer.price} VNĐ",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Fira"),
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
