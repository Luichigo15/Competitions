import 'dart:io';

class Solution {
  void init() {
    final tests = int.parse(stdin.readLineSync()!);
    for (var i = 0; i < tests; i++) {
      List<int> numbers =
          List.from(stdin.readLineSync()!.split(' ').map((e) => int.parse(e)));
      print(_balancedSumns(numbers));
    }
  }

  String _balancedSumns(List<int> numbers) {
    final total = numbers.reduce((value, element) => value+element);
    int sum = 0;
    String result = 'NO';
    numbers.forEach((element) { 
      sum+=element;
      if(sum-element==total-sum){
        result = 'YES';
        return;
      }
    });

    return result;
  }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}

// Java 8 solution
// public static String balancedSums(List<Integer> numbers) {
//   final int total = numbers.stream().reduce(0, (a,b) -> a + b);
//   int sum = 0;
//   String result = "NO";
//   for(Integer element:numbers){
//       sum+=element;
//       if(sum-element==total-sum){
//           result = "YES";
//           break;
//       }    
//   }     
//   return result;
// }
