class ToDo{
  String? id;
  String? todoText;
  bool isDone;


  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList(){
    return[
      ToDo(id: '01', todoText: 'Attend CRISS Workshop', isDone: false),
      ToDo(id: '02', todoText: 'Study ES'),
      ToDo(id: '03', todoText: 'Sleep'),
      ToDo(id: '04', todoText: 'Take Bath'),
    ];
  }
}