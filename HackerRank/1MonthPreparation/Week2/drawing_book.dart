import 'dart:io';

import 'dart:math';

class Solution{
  void init(){
    final totalPages = int.parse(stdin.readLineSync()!);
    final targetPage = int.parse(stdin.readLineSync()!);

    print(_pageCount(totalPages, targetPage));
  }

  int _pageCount(int totalPages,int targetPage){
    final front = targetPage >> 1;
    final back = totalPages%2==1?
                  totalPages-targetPage>>1
                  :totalPages-targetPage +1>>1;
    return min(front, back);
  }

  //dart first solution
  // int _pageCount(int totalPages,int targetPage){
  //   int turns = targetPage<=totalPages-targetPage?
  //               (targetPage/2).floor()
  //               :totalPages%2==1?
  //               ((totalPages-targetPage)/2).floor()
  //               :((totalPages-targetPage)/2).ceil();

  //   return turns;
  // }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}

//Java solution
// public static int pageCount(int totalPages, int targetPage) {
//   int turns =(int)(targetPage<=totalPages-targetPage?
//           Math.floor(targetPage/2)
//           :totalPages%2==1?
//           Math.floor((totalPages-targetPage)/2)
//           :Math.ceil((totalPages-targetPage)/2.0));
//   return turns;
// }