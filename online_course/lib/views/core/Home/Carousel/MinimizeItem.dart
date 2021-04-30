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
    return Container(
        color: Colors.grey,
        child: Row(
          children: [
            Flexible(
                flex: 1,
                child: Image.network(
                  widget.courseContainer.imageUrl,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                )),
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(widget.courseContainer.title),
                    Text(widget.courseContainer.subtitle),
                    RatingBar.builder(
                        initialRating:
                            widget.courseContainer.ratedNumber.toDouble(),
                        itemSize: 25,
                        itemBuilder: (contexPt, _) =>
                            Icon(Icons.star, color: Colors.amber[200]),
                        onRatingUpdate: (updatedStar) =>
                            {print("updated start $updatedStar")}),
                    Text("(${widget.courseContainer.soldNumber})"),
                    Text("${widget.courseContainer.price} VNĐ")
                    //Text(widget.courseContainer.),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
