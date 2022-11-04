class TermsModel {
  String? message;
  List<TermsData> termsDataList =[];

  TermsModel.fromJson({required Map<String,dynamic> json}){
    message = json['message'];
    json['data'].forEach((element){
      TermsData item = TermsData.fromJson(json: element);
      termsDataList.add(item);
    });
  }
}
class TermsData {
  String? Terms;
  TermsData.fromJson({required Map<String,dynamic> json}){
    Terms = json['Terms'];
  }

}
