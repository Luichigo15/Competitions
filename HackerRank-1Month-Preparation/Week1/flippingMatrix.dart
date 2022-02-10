import 'dart:math';
import 'dart:io';

class Solution{
  void init(){
    final tries = int.parse(stdin.readLineSync()!);
    List<List<int>> matrix = [];

    for (var i = 0; i < tries; i++) {
      final size = int.parse(stdin.readLineSync()!);

      for (var i = 0; i < size*2; i++) {
        matrix.add(
          List.from(
            stdin.readLineSync()!.split(' ').map((e) => int.parse(e))
          )
        );
      }
    }

    print(_flippingMatrix(matrix));
    
  }

  int _flippingMatrix(List<List<int>> matrix){
    int sum = 0;
    int size = matrix.length;
    for(int i=0;i<size/2;i++){
        for(int j=0;j<size/2;j++){
            sum+=max(matrix[i][j],
                max(matrix[i][size-1-j],
                max(matrix[size-1-i][j],
                matrix[size-1-i][size-1-j])));
        }
    }
    return sum;
  }

}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}

// Java solution
// public static int flippingMatrix(List<List<Integer>> matrix) {
//         int sum = 0;
//         int size = matrix.size();
//         for(int i=0;i<size/2;i++){
//             for(int j=0;j<matrix.size()/2;j++){
//                 sum+=Math.max(matrix.get(i).get(j),
//                     Math.max(matrix.get(i).get(size-1-j),
//                     Math.max(matrix.get(size-1-i).get(j),
//                     matrix.get(size-1-i).get(size-1-j))));
//             }
//         }
//         return sum;
//     }