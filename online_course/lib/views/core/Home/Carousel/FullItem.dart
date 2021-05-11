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

  String roundNumberTo1Decimal(double x) {
    String rounded = x.toStringAsPrecision(1);
    return rounded;
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
                Text("đ${widget.courseContainer.price}",
                    style: TextStyle(
                        fontSize: 34, fontFamily: "Fira", color: Colors.red)),
                ElevatedButton(
                  child: Text("Mua ngay"),
                  onPressed: () => {},
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Khoá học này bao gồm ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.video_library,
                          color: Colors.red,
                        ),
                        Text(
                            "  Thời gian: ${widget.courseContainer.totalHours.toStringAsFixed(1)} Giờ"),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.movie,
                          color: Colors.blue,
                        ),
                        Text(
                            "  Bài giảng: ${widget.courseContainer.videoNumber} bài"),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.approval,
                          color: Colors.green[200],
                        ),
                        Text("  Nhận chứng chỉ hoàn thành khoá học"),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.all_inclusive,
                          color: Colors.grey,
                        ),
                        Text("  Mua 1 lần cho mãi mãi"),
                      ],
                    ),
                  ],
                )),
                SizedBox(height: 30),
                Container(
                    color: Colors.grey[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Bạn sẽ học được",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: widget.courseContainer.learnWhat
                              .map((item) => ListTile(
                                    leading:
                                        Icon(Icons.check, color: Colors.green),
                                    title: Text("$item"),
                                  ))
                              .toList(),
                        ),
                      ],
                    )),
                SizedBox(height: 30),
                Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Mô tả khoá học",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${widget.courseContainer.description}",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                )),
                SizedBox(height: 30),
                Container(
                    color: Colors.grey[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Yêu cầu của khoá học",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: widget.courseContainer.requirement
                              .map((item) => ListTile(
                                    leading: Icon(
                                      Icons.fiber_manual_record,
                                      color: Colors.green,
                                    ),
                                    title: Text("$item"),
                                  ))
                              .toList(),
                        ),
                      ],
                    )),
                SizedBox(height: 40),
              ],
            )),
      ),
    );
  }
}
