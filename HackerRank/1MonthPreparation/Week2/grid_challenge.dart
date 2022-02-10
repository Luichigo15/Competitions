import 'dart:io';

class Solution {
  void init() {
    final tests = int.parse(stdin.readLineSync()!);
    for (var i = 0; i < tests; i++) {
      final length = int.parse(stdin.readLineSync()!);
      List<String> grid = [];
      List<String> temp = [];
      for (var i = 0; i < length; i++) {
        temp = stdin.readLineSync()!.split('');
        temp.sort();
        grid.add(temp.join());
      }

      print(_gridChallenge(grid));
    }
  }

  String _gridChallenge(List<String> grid) {
    String result = 'YES';
    for (var i = 0; i < grid.length && result == 'YES'; i++) {
      for (var j = 0; j < grid.length - 1; j++) {
        if (grid[j].codeUnitAt(i) > grid[j + 1].codeUnitAt(i)) {
          result = 'NO';
          break;
        }
      }
    }

    return result;
  }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}

// Java solution
// public static String gridChallenge(List<String> grid) {
//   char[] parts;
//   for(int i=0;i<grid.size();i++){
//       parts = grid.get(i).toCharArray();
//       Arrays.sort(parts);
//       grid.set(i,new String(parts));
//   }
//   String result = "YES";
//   for (int i = 0; i < grid.size() && result.equals("YES"); i++) {
//       for (int j = 0; j < grid.size()-1; j++) {
//           if((int)grid.get(j).charAt(i)>(int)grid.get(j+1).charAt(i)){
//           result = "NO";
//           break;
//           }
//       }
//   }    
//   return result;
// }
