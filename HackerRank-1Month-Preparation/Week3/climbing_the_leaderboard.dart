import 'dart:io';

class Solution {
  void init() {
    final leaderboard = List<int>.from(
        stdin.readLineSync()!.split(' ').map((e) => int.parse(e)));

    final scores = List<int>.from(
        stdin.readLineSync()!.split(' ').map((e) => int.parse(e)));

    print(_climbingLeaderboard(leaderboard, scores));
  }

  List<int> _climbingLeaderboard(List<int> leaderboard, List<int> scores) {
    final finalLeaderboard = leaderboard.toSet().toList();
    List<int> results = [];

    int temp = -1;
    int position = finalLeaderboard.length + 1;

    scores.forEach((number) {
      if (temp == number) {
        results.add(position);
        return;
      }

      for (int i = position - 2; i >= 0; i--) {
        if (finalLeaderboard[i] <= number) {
          position--;
          continue;
        }
        temp = number;
        results.add(position);
        break;
      }
    });
    while (results.length != scores.length) results.add(1);

    return results;
  }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}

// Java solution
// public static List<Integer> climbingLeaderboard(List<Integer> ranked, List<Integer> player) {
//   final ArrayList<Integer> finalLeaderboard = new ArrayList<Integer>(new HashSet<Integer>(ranked));
//   ArrayList<Integer> results = new ArrayList<Integer>();
//   Collections.sort(finalLeaderboard, Collections.reverseOrder());
//   int temp = -1;
//   int position = finalLeaderboard.size() + 1;
//   for (Integer number : player) {
//     if (temp == number) {
//       results.add(position);
//       continue;
//     }
//     for (int i = position - 2; i >= 0; i--) {
//       if (finalLeaderboard.get(i) <= number) {
//         position--;
//         continue;
//       }
//       temp = number;
//       results.add(position);
//       break;
//     }
//   }
//   while (results.size() != player.size())
//       results.add(1);
//   return results;
// }
