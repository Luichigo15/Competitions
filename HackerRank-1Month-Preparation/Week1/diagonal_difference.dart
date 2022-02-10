import 'dart:io';

class Solution{
  void init(){
    final size = int.parse(stdin.readLineSync()!);
    List<List<int>> matrix = [];

    for (var i = 0; i < size; i++) {
      List<int> row = List.from(
        (stdin.readLineSync()!).split(" ").map((e) => int.parse(e))
      );
      matrix.add(row);
    }

    print(_difference(matrix));
  }

  int _difference(List<List<int>> matrix){
    int diag1 =0, diag2 = 0;
    final size = matrix.length;
    for (var i = 0; i < size; i++) {
      for (var j = 0; j < size; j++) {
        if(i==j) diag1+=matrix[i][j];
        if(size-(i+1)==j) diag2+=matrix[i][j];
      }
    }

    return (diag1-diag2).abs();
  }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}

// Java solution
// public static int diagonalDifference(List<List<Integer>> matrix) {
//   int diag1 =0, diag2 = 0;
//   int size = matrix.size();
//   for (int i = 0; i < size; i++) {
//     for (int j = 0; j < size; j++) {
//       if(i==j) diag1+=matrix.get(i).get(j);
//       if(size-(i+1)==j) diag2+=matrix.get(i).get(j);
//     }
//   }
//   return Math.abs(diag1-diag2);
// }