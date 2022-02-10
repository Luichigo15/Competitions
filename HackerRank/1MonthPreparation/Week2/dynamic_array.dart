import 'dart:io';

class Solution {
  void init() {
    final sizeQueries =
        List.from(stdin.readLineSync()!.split(' ').map((e) => int.parse(e)));

    List<List<int>> queries = [];
    for (var i = 0; i < sizeQueries[1]; i++) {
      queries.add(
          List.from(stdin.readLineSync()!.split(' ').map((e) => int.parse(e))));
    }

    print(_dynamicArray(sizeQueries[0], queries));
  }

  List<int> _dynamicArray(int size, List<List<int>> queries) {
    List<List<int>> arrays = List.generate(size, (index) => []);
    List<int> answers = [];
    int lastAnswer = 0;
    queries.forEach((query) {
      final tempIdx = (query[1]^lastAnswer)%size;
      if(query[0]==1){
        arrays[tempIdx].add(query[2]);
      }else{
        lastAnswer = arrays[tempIdx][query[2]%arrays[tempIdx].length];
        answers.add(lastAnswer);
      }
    });

    return answers;
  }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}

// Javascript solution
// function dynamicArray(size, queries) {
//     let arrays = [];
//     let answers = [];
//     let lastAnswer = 0;
//     queries.forEach((query) =>{
//       const tempIdx = (query[1]^lastAnswer)%size;
//       if(arrays[tempIdx]==undefined)arrays[tempIdx] = [];
//       if(query[0]==1){
//         arrays[tempIdx].push(query[2]);
//       }else{
//         lastAnswer = arrays[tempIdx][query[2]%arrays[tempIdx].length];
//         answers.push(lastAnswer);
//       }
//     });

//     return answers;
// }
