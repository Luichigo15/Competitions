import 'dart:io';

class Solution{
  void init(){
    final tests = int.parse(stdin.readLineSync()!);
    for (var i = 1; i <= tests; i++) {
      print('Case #${i}: ${_decideRuler(stdin.readLineSync()!.toLowerCase())}');
    }
  }

  String _decideRuler(String name){

    List<String> vowels = ['a', 'e', 'i', 'o', 'u'];

    return "$name is ruled by ${
      name.endsWith('y')?'nobody':
      vowels.contains(name[name.length-1])?'Alice':'Bob'
      }";
  }
}

void main(){
  final solution = Solution();
  solution.init();
}