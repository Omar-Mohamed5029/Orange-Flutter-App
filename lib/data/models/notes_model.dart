class NotesModel {
  final String title;
  final String description;
  final int? id;
  final String Date;
  final String hours;

  NotesModel({
    required this.title,
    required this.description,
    required this.Date,
    required this.hours,
     this.id
  });

  factory NotesModel.fromMap(Map<String, dynamic>json)=>
      new NotesModel(
          title: json['title'],
          description: json['description'],
          id: json['id'],
      Date: json['Date'],
      hours: json['hours']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description' : description,
      'Date':Date,
      'hours':hours
    };
  }
}
