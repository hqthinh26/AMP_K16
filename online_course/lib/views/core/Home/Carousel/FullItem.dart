import "package:flutter/material.dart";
import "package:online_course/containers/CourseContainer.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import "package:date_format/date_format.dart";
import './VideoPlayerCustom.dart';

class FullItem extends StatefulWidget {
  final CourseContainer courseContainer;
  FullItem({Key? key, required this.courseContainer}) : super(key: key);

  @override
  _FullItemState createState() => _FullItemState();
}

class _FullItemState extends State<FullItem> {
  String formatTimestamptz(String x) {
    String monthYear = formatDate(DateTime.parse(x), [mm, '-', yyyy]);
    return monthYear;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text("Thông tin khoá học"),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.courseContainer.title,
                  //overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.courseContainer.subtitle,
                  //overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    //fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    children: [
                      Text("${widget.courseContainer.ratedNumber}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          )),
                      SizedBox(width: 5),
                      RatingBar.builder(
                          ignoreGestures: true,
                          initialRating:
                              widget.courseContainer.ratedNumber.toDouble(),
                          itemSize: 17,
                          itemBuilder: (contexPt, _) =>
                              Icon(Icons.star, color: Colors.amber[200]),
                          onRatingUpdate: (updatedStar) =>
                              {print("updated start $updatedStar")}),
                      SizedBox(width: 5),
                      Text(
                        "(Đã bán: ${widget.courseContainer.soldNumber})",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Giảng viên:",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " ${widget.courseContainer.instructorUserName}",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.new_releases,
                      color: Colors.red,
                    ),
                    Text(
                      "  Lần cuối cập nhật: ",
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      this.formatTimestamptz(widget.courseContainer.updatedAt),
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: Colors.blue,
                    ),
                    Text(
                      "  Tiếng việt",
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.closed_caption_off,
                      color: Colors.black,
                    ),
                    Text(
                      "  Tiếng việt [Mặc định]",
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: VideoPlayerCustom(
                    promoVidUrl: widget.courseContainer.promoVidUrl,
                  ),
                  // child: Container(
                  //   color: Colors.red,
                  // )
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Khoá học này bao gồm: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.stretch,
                //   children: [
                //     Icon(
                //       Icons.video_library,
                //       color: Colors.black,
                //     ),
                //     //Text("  ${widget.courseContainer.totalHours} giờ")
                //   ],
                // ),
              ],
            )),
      ),
    );
  }
}
