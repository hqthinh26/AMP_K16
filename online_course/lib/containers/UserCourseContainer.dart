import "./CourseContainer.dart";

class UserCourseContainer {
  String id = "";
  String courseTitle = "";
  int coursePrice = -100;
  String courseImage =
      "https://www.google.com.vn/search?q=price+image&sxsrf=ALeKk02-L3CZNPUS4Iu9DugrXl2rS6Iixw:1621336435911&tbm=isch&source=iu&ictx=1&fir=KWvPRXYgXRDMHM%252Cvm8L4HO3rFZrbM%252C_&vet=1&usg=AI4_-kQDPq-Iwl8on20EGuA0h-loNv2iXQ&sa=X&ved=2ahUKEwjr-cryjNPwAhUt-2EKHd_FAVMQ9QF6BAgQEAE&biw=1366&bih=912#imgrc=wnA0q23kFQKPPM";
  String instructorId = "";
  String instructorName = "";
  int courseSoldNumber = 0;
  dynamic courseContentPoint = 0;
  dynamic courseFormalityPoint = 0;
  dynamic coursePresentationPoint = 0;
  dynamic courseAveragePoint = 0;

  UserCourseContainer(
      {Map<String, dynamic> courseInfo = const <String, dynamic>{}}) {
    this.id = courseInfo["id"] ?? this.id;
    this.courseTitle = courseInfo["courseTitle"] ?? this.courseTitle;

    this.coursePrice = courseInfo["coursePrice"] ?? this.coursePrice;

    this.courseImage = courseInfo["courseImage"] ?? this.courseImage;
    this.instructorId = courseInfo["instructorId"] ?? this.instructorId;
    this.instructorName = courseInfo["instructorName"] ?? this.instructorName;
    this.courseSoldNumber =
        courseInfo["courseSoldNumber"] ?? this.courseSoldNumber;
    this.courseContentPoint =
        courseInfo["courseContentPoint"] ?? this.courseContentPoint;
    this.courseFormalityPoint =
        courseInfo["courseFormalityPoint"] ?? this.courseFormalityPoint;
    this.coursePresentationPoint =
        courseInfo["coursePresentationPoint"] ?? this.coursePresentationPoint;
    this.courseAveragePoint =
        courseInfo["courseAveragePoint"] ?? this.courseAveragePoint;
  }

  CourseContainer toCourseContainerObject() {
    Map<String, dynamic> stuffer = {
      "id": this.id,
      "title": this.courseTitle,
      "price": this.coursePrice,
      "imageUrl": this.courseImage,
      "instructor.user.id": this.instructorId,
      "instructor.user.name": this.instructorName,
      "soldNumber": this.courseSoldNumber,
      "contentPoint": this.courseContentPoint,
      "formalityPoint": this.courseFormalityPoint,
      "presentationPoint": this.coursePresentationPoint,
    };
    //print(stuffer);
    return CourseContainer(stuffer);
  }
}
