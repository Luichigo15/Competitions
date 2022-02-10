import 'dart:io';

class Solution{
  void init(){
    final dishes = int.parse(stdin.readLineSync()!);
    print(_waiter(List.from(
      stdin.readLineSync()!.split(' ').map((e) => int.parse(e))
    ), dishes));
  }

  List<int> _waiter(List<int> dishes, int q){
    
  }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}