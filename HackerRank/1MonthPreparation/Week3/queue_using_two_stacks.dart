import 'dart:collection';
import 'dart:io';

class Solution{
  void init(){
    Queue queue = Queue();

    final total = int.parse(stdin.readLineSync()!);
    List<int> queries = [];
    for (var i = 0; i < total; i++) {
      queries = List.from(stdin.readLineSync()!.split(' ').map((e) => int.parse(e)));
      switch (queries[0]) {
        case 1:
            queue.add(queries[1]);
          break;
        case 2:
            queue.removeFirst();
          break;
        case 3:
          print(queue.first);
          break;
        default:
      }
    }
  }
}
void main(List<String> args) {
  final solution = Solution();
  solution.init();
}

/* 
In this problem i don't want to use two stack because in
other problem a implement a stack using a queue in dart, so 
it's the same

public static void main(String[] args) {
  Queue<String>  queue = new LinkedList<>();
  Scanner sc = new Scanner(System.in);
  int total = Integer.parseInt(sc.nextLine());
  for (int i = 0; i < total; i++) {
    String queries[] = sc.nextLine().split(" ");
    switch (queries[0]) {
      case "1":
          queue.add(queries[1]);
        break;
      case "2":
          queue.remove();
        break;
      case "3":
        System.out.println(queue.peek());
        break;
      default:
    }
  }
} */