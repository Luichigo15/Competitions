import 'dart:io';

class Solution{
  void init(){
    final int n = int.parse(stdin.readLineSync()!);
    final List<int> numbers = List.from(
      (stdin.readLineSync()!).split(" ").map(int.parse)
    );
    
    stdout.writeln(_lonelyInteger(numbers));
  }

  int _lonelyInteger(List<int> numbers){
    int lonely = 0;
    numbers.forEach((number){
      final List<int> sorted = numbers.where((element) => number==element).toList();
      if(sorted.length == 1){
        lonely = sorted[0];
        return;
      } 
    });

    /**
     * Solucion corta
     * numbers.forEach((element) => lonely = lonely^element);
     * return lonely;
     */

    return lonely;
  }
}

// Java
// public static int lonelyinteger(List<Integer> a) {
//         int lonely=0, cont;
//         Collections.sort(a);
//         for(Integer n:a){
//             cont = 0;
//             for(Integer n2:a){
//                 if(n2==n) cont++;
//             }
//             if(cont==1){
//                 lonely = n;
//                 break;
//             }
//         }

//         return lonely;
//     }

main(List<String> args) {
  final solution = Solution();
  solution.init();
}