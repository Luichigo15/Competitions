import 'dart:io';

class Solution{
  void init(){
    final List<int> numbers = List.from(
      stdin.readLineSync()!.split(' ').map((e) => int.parse(e))
      );

    final dayMonth = List.from(
      stdin.readLineSync()!.split(' ').map((e) => int.parse(e))
      );

    final day = dayMonth[0] ;
    final month = dayMonth[1] ;

    print(_birthday(numbers, day, month));
  }

  int _birthday(List<int> numbers,int day,int month){
    int temp = 0,cont = 0;
    for (var i = 0; i <= numbers.length-month; i++) {
      temp = 0;
      for (var j = i; j < i+month; j++) {
        temp+=numbers[j];
      }
      if(temp==day){
        cont++;
      }
    }

    return cont;
  }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}

//Java solution
// public static int birthday(List<Integer> numbers, int day, int month) {
//   int temp = 0,cont = 0;
//   for (int i = 0; i <= numbers.size()-month; i++) {
//     temp = 0;
//     for (int j = i; j < i+month; j++) {
//       temp+=numbers.get(j);
//     }
//     if(temp==day){
//       cont++;
//     }
//   }
//   return cont;
// }