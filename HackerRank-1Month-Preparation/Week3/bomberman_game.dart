import 'dart:io';
import '../reader.dart';

/**
 * 
 * The clue here is that we have only 4 states
 * Considering N as time:
 * 1) If N=1 then the result is the same as the inital state
 * 2) If N%2=0 then the result is a full bombs grid because bombs are planted in odd seconds
 * 3) If (N-3)%4=0 then the result is the first iteration of bombs exploding
 * 4) If (N-3)%4!=0 then the result is the second iteration of bombs exploding
 * 
 * Iterations are cycling every 4 four seconds
 * 
 */

class Solution {
  void init() async {
    final List<int> data =
        List.from(stdin.readLineSync()!.split(' ').map((e) => int.parse(e)));

    final reader = Reader();
    String text =
        await reader.readFile(Directory.current.parent.path + '/test.txt');

    List<String> grid = []; //text.split('\n');
    for (var i = 0; i < data[0]; i++) {
      grid.add(stdin.readLineSync()!);
    }

    print(_bomberMan(data[2], grid));
  }

  List<String> _bomberMan(int seconds, List<String> grid) {
    if (seconds == 1) return grid;

    final fullBombs = 'o'.padRight(grid[0].length, 'o');
    final defaultGrid = List.generate(grid.length, (index) => fullBombs);

    if (seconds % 2 == 0) return defaultGrid;

    Map<int, List<int>> bombs = {};
    final rows = grid.length;
    final columns = fullBombs.length;

    int contVar = (seconds - 3) % 4 == 0 ? 1 : 2;
    while (contVar > 0) {
      for (var i = 0; i < grid.length; i++) {
        if (!grid[i].contains('o')) continue;
        final letter = grid[i].codeUnits;
        for (var j = 0; j < letter.length; j++) {
          if (String.fromCharCode(letter[j]) != 'o') continue;
          if (bombs[i] == null) bombs[i] = [];
          bombs[i]!.add(j);
        }
      }
      grid = [...defaultGrid];
      bombs.forEach((key, row) {
        row.forEach((value) {
          grid[key] = grid[key].replaceRange(value, value + 1, '.');
          if (key + 1 < rows)
            grid[key + 1] = grid[key + 1].replaceRange(value, value + 1, '.');
          if (key - 1 >= 0)
            grid[key - 1] = grid[key - 1].replaceRange(value, value + 1, '.');
          if (value + 1 < columns)
            grid[key] = grid[key].replaceRange(value + 1, value + 1 + 1, '.');
          if (value - 1 >= 0)
            grid[key] = grid[key].replaceRange(value - 1, value - 1 + 1, '.');
        });
      });
      bombs.clear();
      contVar--;
    }

    return grid;
  }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}

// Javascript solution
// String.prototype.replaceAt = function(index, replacement) {
//     return this.substr(0, index) + replacement + this.substr(index + replacement.length);
// }
// function bomberMan(seconds, grid) {
//   if(seconds==1) return grid;
  
//   let fullBombs = 'O'.padEnd(grid[0].length, 'O');
//   let defaultGrid = [];
//   grid.forEach(()=>defaultGrid.push(fullBombs));
  
//   if(seconds%2==0)return defaultGrid;
  
//   let bombs = {};
//   let rows = grid.length;
//   let columns = fullBombs.length;
//   let contVar = (seconds-3)%4==0?1:2;
//   while (contVar>0) {
//     for (var i = 0; i < grid.length; i++) {
//       if (!grid[i].includes('O')) continue;
//       for (var j = 0; j < grid[i].length; j++) {
//         if (grid[i].charAt(j) != 'O') continue;
//         if (bombs[i] == null) bombs[i] = [];
//         bombs[i].push(j);
//       }
//     }
//     grid = [...defaultGrid];
//     Object.keys(bombs).forEach((key) =>{
//       let row = bombs[key];
//       key = parseInt(key);
//       row.forEach((value) =>{
//         grid[key] = grid[key].replaceAt(value, '.');
//         if (key + 1 < rows)
//           grid[key + 1] = grid[key + 1].replaceAt(value, '.');
//         if (key - 1 >= 0)
//           grid[key - 1] = grid[key - 1].replaceAt(value, '.');
//         if (value + 1 < columns)
//           grid[key] = grid[key].replaceAt(value + 1, '.');
//         if (value - 1 >= 0)
//           grid[key] = grid[key].replaceAt(value - 1, '.');
//       });
//     });
//     bombs={};
//   }
//   return grid;
// }
