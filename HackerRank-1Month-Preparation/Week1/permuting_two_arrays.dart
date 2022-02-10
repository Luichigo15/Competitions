import 'dart:io';

class Solution{
  void init(){
    final tries = int.parse(stdin.readLineSync()!);
    
    for (var i = 0; i < tries; i++) {
      final data = stdin.readLineSync()!.split(' ');
      final size = int.parse(data[0]);
      final limit = int.parse(data[1]);
      List<int> arrayA = List.from(
        (stdin.readLineSync()!).split(' ').map((e) => int.parse(e))
      );
      List<int> arrayB = List.from(
        (stdin.readLineSync()!).split(' ').map((e) => int.parse(e))
      );

      print(_permuting(limit, arrayA, arrayB));
    }
  }

  String _permuting(int limit,List<int> arrayA, List<int> arrayB){
    arrayA.sort();
    arrayB.sort();
    arrayB = arrayB.reversed.toList();

    String result = 'YES';
    for (var i = 0; i < arrayA.length; i++) {
      if(arrayA[i]+arrayB[i] < limit){
        result = 'NO';
        break;
      }
    }

    return result;
  }
}

main(List<String> args) {
  final solution  = Solution();
  solution.init();
}

// Java Solution
// public static String twoArrays(int limit, List<Integer> arrayA, List<Integer> arrayB) {
//   Collections.sort(arrayA);
//   Collections.sort(arrayB, Collections.reverseOrder());
//   String result = "YES";
//   for (int i = 0; i < arrayA.size(); i++) {
//     if(arrayA.get(i)+arrayB.get(i) < limit){
//       result = "NO";
//       break;
//     }
//   }
//   return result;
// }