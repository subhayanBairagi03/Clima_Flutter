void main() {
  allTasks();
}

void allTasks() async {
  task1();
  String wow = await task2();
  task3(wow);
}

void task1() {
  String result = 'heyy 1 ';
  print('Hello from task 1');
}

Future<String> task2() async {
  Duration duration = Duration(seconds: 3);
  String result = " ";
  Future.delayed(duration, () {
    result = 'Heyy 2';
    print('Hello from task 2 $result');
  });
  return result;
}

void task3(String task) {
  String result = 'heyy 3';
  print('Hello from task $task');
}
