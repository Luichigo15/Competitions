import 'dart:io';

class Solution{
  void init(){
    final total = int.parse(stdin.readLineSync()!);
    for (var i = 0; i < total; i++) {
      final data = List.from(
        stdin.readLineSync()!.split(' ').map(int.parse)
      );
      final result = _calculateCard(data[0], data[1]);
      print('Case #${i+1}:\n$result');
    }
    
  }

  String _calculateCard(int rows,int cols){
    final row1 = '+-';
    final row2 = '|.';

    String result = '';

    for (var i = 0; i < rows; i++) {
      if(i==0){
        result += '..'+(row1*(cols-1))+'+\n';
        result += '..'+(row2*(cols-1))+'|\n';
      }else{
        result += (row1*cols)+'+\n';
        result += (row2*cols)+'|\n';
      }
    }

    result += (row1*cols)+'+';

    return result;
  }
}

main(){
  final solution = Solution();
  solution.init();
}