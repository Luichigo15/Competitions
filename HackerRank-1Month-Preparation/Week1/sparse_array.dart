import 'dart:io';

class Solution {
  void init() {
    final stringsCount = int.parse(stdin.readLineSync()!);
    final List<String> strings = [];
    for (var i = 0; i < stringsCount; i++) {
      strings.add(stdin.readLineSync()!);
    }

    final queriesCount = int.parse(stdin.readLineSync()!);
    final List<String> queries = [];
    for (var i = 0; i < queriesCount; i++) {
      queries.add(stdin.readLineSync()!);
    }


    matchStrings(strings, queries).forEach(stdout.writeln);
  }

  List<int> matchStrings(List<String> strings, List<String> queries) {
    List<int> results = List.from(queries
        .map((querie) => strings.where((element) => element == querie).length));

    return results;
  }

  // JAVA Solution
  // public static List<Integer> matchingStrings(List<String> strings, List<String> queries) {
  //       List<Integer> results = new ArrayList<Integer>();
  //       for(String query:queries){
  //           int cont = 0;
  //           for(String str: strings){
  //               if(str.equals(query)) cont++;
  //           }
  //           results.add(cont);
  //       }

  //       return results;
  //   }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}
