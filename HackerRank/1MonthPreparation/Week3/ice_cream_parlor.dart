import 'dart:io';

class Solution {
  void init() {
    final tests = int.parse(stdin.readLineSync()!);
    for (var i = 0; i < tests; i++) {
      print(_iceCreamParlor(
          int.parse(stdin.readLineSync()!),
          List.from(
              stdin.readLineSync()!.split(' ').map((e) => int.parse(e)))));
    }
  }

  List<int> _iceCreamParlor(int money, List<int> prices) {
    List<int> results = [];
    int minus = 0;
    for (var i = 0; i < prices.length; i++) {
      minus = money - prices[i];
      if (prices.contains(minus) && prices.lastIndexOf(minus) != i) {
        results.add(i + 1);
        results.add(prices.lastIndexOf(minus) + 1);
        break;
      }
    }
    results.sort();
    return results;
  }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}

// Java solution
// public static List<Integer> icecreamParlor(int money, List<Integer> prices) {
//   ArrayList<Integer> results = new ArrayList();
//   int minus = 0;
//   for (int i = 0; i < prices.size(); i++) {
//     minus = money-prices.get(i);
//     if(prices.contains(minus) && prices.lastIndexOf(minus)!=i){
//       results.add(i+1);
//       results.add(prices.lastIndexOf(minus)+1);
//       break;
//     }
//   }
//   Collections.sort(results);
//   return results;    
// }
