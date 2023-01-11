
class Todo{
  int userId=0;
  int id=0;
  String title='';
  bool completed=false;

  Todo({required this.userId,required this.id,required this.title,required this.completed});

  factory Todo.fromJson(Map<String,dynamic> parsedJson){
    return Todo(
      userId: parsedJson['userId'],
      id: parsedJson['id'],
      title: parsedJson['title'],
      completed: parsedJson['completed']
    );
  }

}