import 'dart:io';

class Solution{
  void init(){
    final tests = int.parse(stdin.readLineSync()!);
    List<int> citations;
    int papers;
    for (var i = 1; i <= tests; i++) {
      papers = int.parse(stdin.readLineSync()!);
      citations = List.from(stdin.readLineSync()!.split(' ').map(int.parse));
      print('Case #${i}: ${_calculateIndex(papers, citations)}');
    }
  }

  String _calculateIndex(int papers,List<int> citations){
    int index = 1;
    if(papers == 1) return index.toString();

    String total = '$index';
    int totalCitations = 0;

    for (var i = 1; i < papers; i++) {
      index++;
      totalCitations = citations.sublist(0,i+1).where((element) => element>=index).length;

      if(totalCitations<index) index--;

      total+=' $index';

    }

    return total;
  }
}

void main(){
  final solution = Solution();
  solution.init();
}