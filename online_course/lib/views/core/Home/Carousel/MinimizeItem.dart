import "package:flutter/material.dart";
import 'package:online_course/containers/CourseContainer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MinimizeItem extends StatefulWidget {
  late final CourseContainer courseContainer;

  MinimizeItem({Key? key, required this.courseContainer}) : super(key: key);

  @override
  _MinimizeItemState createState() => _MinimizeItemState();
}

class _MinimizeItemState extends State<MinimizeItem> {
  final spinkit = SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.red : Colors.green,
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    if (widget.courseContainer.isLoading) {
      return spinkit;
    } else {
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
              color: Colors.black,
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
                          color: Colors.white,
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
                            color: Colors.white,
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
                              initialRating: widget.courseContainer.star,
                              itemSize: 17,
                              itemBuilder: (contexPt, _) =>
                                  Icon(Icons.star, color: Colors.amber[200]),
                              onRatingUpdate: (updatedStar) =>
                                  {print("updated start $updatedStar")},
                              unratedColor: Colors.grey[800],
                            ),
                            Text(
                              "(Đã bán: ${widget.courseContainer.soldNumber})",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.yellow,
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
                        "đ${widget.courseContainer.price}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
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
}
