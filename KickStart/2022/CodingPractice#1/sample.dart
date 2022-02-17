import 'dart:io';

class Solution{
  void init(){
    final tests = int.parse(stdin.readLineSync()!);
    List<int> data, candies;
    for (var i = 0; i < tests; i++) {
      data = List.from(stdin.readLineSync()!.split(' ').map((e) => int.parse(e)));
      candies = List.from(stdin.readLineSync()!.split(' ').map((e) => int.parse(e)));

      print('Case #${i+1}: ${_calculateCandies(data, candies)}');
    }
  }

  int _calculateCandies(List<int> data,List<int> candies){
    int totalCandies = 0;

    totalCandies = candies.reduce((value, element) => value+element);

    return totalCandies%data[1];
  }
}

void main(){
  final solution = Solution();
  solution.init();
}