class LecturesModel {
  String? code;
  String? message;
List<LecturesData> lecturesDataList =[];

  LecturesModel.fromJson({required Map<String,dynamic> json}){
    code = json['code'];
    message = json['message'];
    json['data'].forEach((element){
      LecturesData item = LecturesData.fromJson(json: element);
      lecturesDataList.add(item);
    });
  }
}
class LecturesData {
  String? lectureSubject;
  String? lectureDate;
  String? lectureStartTime;
  String? lectureEndTime;

  LecturesData.fromJson({required Map<String,dynamic> json}){
    lectureSubject = json['lectureSubject'];
    lectureDate = json['lectureDate'];
    lectureStartTime = json['lectureStartTime'];
    lectureEndTime = json['lectureEndTime'];
  }

}
