import 'dart:io';

import 'dart:math';

class Solution {
  void init() {
    final total = int.parse(stdin.readLineSync()!);
    for (var i = 1; i <= total; i++) {
      final List<int> p1 =
          List.from(stdin.readLineSync()!.split(' ').map(int.parse));
      final List<int> p2 =
          List.from(stdin.readLineSync()!.split(' ').map(int.parse));
      final List<int> p3 =
          List.from(stdin.readLineSync()!.split(' ').map(int.parse));
      print('Case #$i: ${_calculateColor(p1, p2, p3)}');
    }
  }

  String _calculateColor(List<int> p1, List<int> p2, List<int> p3) {
    String result = '';

    List<int> c = [p1[0], p2[0], p3[0]];
    List<int> m = [p1[1], p2[1], p3[1]];
    List<int> y = [p1[2], p2[2], p3[2]];
    List<int> k = [p1[3], p2[3], p3[3]];
    c.sort();
    m.sort();
    y.sort();
    k.sort();

    if (c[0] + m[0] + y[0] + k[0] >= 1000000) {
      final total = [c[0], m[0], y[0], k[0]];
      int reach = 1000000;

      if (c[0] == 0) {
        result += '0 ';
      } else {
        result += '${c[0]} ';
        reach -= c[0];
      }
      if (reach == 0) {
        result += '0 0 0';
        return result;
      } else {
        if (reach - m[0] <= 0) {
          result += '${min(reach, m[0])} 0 0';
          return result;
        } else {
          if (m[0] == 0) {
            result += '0 ';
          } else {
            result += '${m[0]} ';
            reach -= m[0];
          }
          if (reach - y[0] <= 0) {
            result += '${min(reach, y[0])} 0';
            return result;
          } else {
            if (y[0] == 0) {
              result += '0 ';
            } else {
              result += '${y[0]} ';
              reach -= y[0];
            }

            if (reach - k[0] <= 0) {
              result += '${min(reach, k[0])}';
              return result;
            } else {
              if (k[0] == 0) {
                result += '0';
              } else {
                result += '${k[0]} ';
                reach -= k[0];
              }
            }
          }
        }
      }
    } else {
      result = 'IMPOSSIBLE';
    }

    return result;
  }
}

void main(List<String> args) {
  final solution = Solution();
  solution.init();
}
