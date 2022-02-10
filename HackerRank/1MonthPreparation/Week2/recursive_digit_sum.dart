import 'dart:io';

import '../reader.dart';

class Solution {
  void init() async {
    //final data = List.from(stdin.readLineSync()!.split(' '));
    final reader = Reader();
    String data =
        await reader.readFile(Directory.current.parent.path+'/test.txt');
    print(_superDigit(data.split(' ')[0],int.parse(data.split(' ')[1])));
  }

  int _superDigit(String n, int k) {
    if(n.length==1 && k==1) return int.parse(n);

    double sum = 0;
    n.split('').forEach((element) => sum+=double.parse(element));
    sum*=k;

    return _superDigit(sum.toString().replaceAll('.0',''), 1);
  }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}


// Java solution
// public static int superDigit(String n, int k) {
//   if(n.length() == 1 && k == 1) {
//       return Integer.parseInt(n);
//   }
//   long sum = 0;
//   for(char digit : n.toCharArray()) {
//       sum += Character.getNumericValue(digit);
//   }
//   sum *= k;
//   return superDigit(Long.toString(sum), 1);    
// }