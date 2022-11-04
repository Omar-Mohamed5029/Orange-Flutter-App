class FinalModel {
  String? code;
  String? message;
  List<FinalsData> finalsDataList =[];

  FinalModel.fromJson({required Map<String,dynamic> json}){
    code = json['code'];
    message = json['message'];
    json['data'].forEach((element){
      FinalsData item = FinalsData.fromJson(json: element);
      finalsDataList.add(item);
    });
  }
}
class FinalsData {
  String? finalSubject;
  String? finalDate;
  String? finalStartTime;
  String? finalEndTime;
  // bool? exam;

  FinalsData.fromJson({required Map<String,dynamic> json}){
    finalSubject = json['examSubject'];
    finalDate = json['examDate'];
    finalStartTime = json['examStartTime'];
    finalEndTime = json['examEndTime'];
    // exam =json['final'];
  }

}
