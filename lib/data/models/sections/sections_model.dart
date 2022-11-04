class SectionsModel {
  String? code;
  String? message;
  List<SectionsData> sectionsDataList =[];

  SectionsModel.fromJson({required Map<String,dynamic> json}){
    code = json['code'];
    message = json['message'];
    json['data'].forEach((element){
      SectionsData item = SectionsData.fromJson(json: element);
      sectionsDataList.add(item);
    });
  }
}
class SectionsData {
  String? sectionSubject;
  String? sectionDate;
  String? sectionStartTime;
  String? sectionEndTime;

  SectionsData.fromJson({required Map<String,dynamic> json}){
    sectionSubject = json['sectionSubject'];
    sectionDate = json['sectionDate'];
    sectionStartTime = json['sectionStartTime'];
    sectionEndTime = json['sectionEndTime'];
  }

}
