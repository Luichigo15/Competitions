import 'dart:io';

import 'dart:math';

class Solution{
  void init(){
    final tests = int.parse(stdin.readLineSync()!);
    for (var i = 0; i < tests; i++) {
      print(_counterGame(BigInt.tryParse(stdin.readLineSync()!)!));
    }
  }

  String _counterGame(BigInt n){
    int counter = 0;
    while(n.compareTo(BigInt.from(1))!=0){
      counter++;
      final binaryString = n.toRadixString(2);
      n = binaryString.lastIndexOf('1')==0?
          n~/BigInt.from(2):n-BigInt.from(pow(2,binaryString.length-1));
    }

    return counter%2==0?'Richard':'Louise';
  }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}

// Java solution
// public static String counterGame(long n) {
//   int counter = 0;
//   while(n!=1){
//       counter++;
//       final String binaryString = Long.toBinaryString(n);
//       n = (long)(binaryString.lastIndexOf("1")==0?
//           n/2:n-Math.pow(2,binaryString.length()-1));
//   }
//   return counter%2==0?"Richard":"Louise";
// }