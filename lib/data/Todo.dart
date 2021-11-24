class Todo{
  static const String collectionname='todos';
  String id;
  String title;
  String description;
  bool isDone;
  DateTime dateTime;
  Todo(
      { required this.id,
        required this.title,
        required this.description,
        required this.dateTime,
        this.isDone = false});
  //fromjson bta5d aljson w trag3 object mn todo

  Todo.fromJson(Map<String, dynamic> json)
      : this(
      id: json['id']! as String,
      title: json['title']! as String,
      description: json['description']! as String,
      dateTime:
      DateTime.fromMillisecondsSinceEpoch(json['dateTime']! as int),
      isDone: json['isDone']! as bool);

  Map<String, dynamic> toJson(){
    return{
  'id':id,
  'title':title,
  'description':description,
  'dateTime':dateTime.millisecondsSinceEpoch,
  'isDone':isDone
  };
}
}