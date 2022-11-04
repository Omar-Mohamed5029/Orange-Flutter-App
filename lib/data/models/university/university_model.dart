class UniversityModel {
  String? code;
  String? message;
  List<UniversityData> universityDataList =[];

  UniversityModel.fromJson({required Map<String,dynamic> json}){
    code = json['code'];
    message = json['message'];
    json['data'].forEach((element){
      UniversityData item = UniversityData.fromJson(json: element);
      universityDataList.add(item);
    });
  }
}
class UniversityData {
  String? name;
  UniversityData.fromJson({required Map<String,dynamic> json}){
    name = json['name'];
  }

}
