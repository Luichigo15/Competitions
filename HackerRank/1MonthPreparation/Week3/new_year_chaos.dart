import 'dart:io';

class Solution {
  void init() {
    final tests = int.parse(stdin.readLineSync()!);

    for (var i = 0; i < tests; i++) {
      _minimumBribes(
          List.from(stdin.readLineSync()!.split(' ').map((e) => int.parse(e))));
    }
  }

  void _minimumBribes(List<int> numbers) {
    int cont = 0;
    int temp = 0;
    for (int i = numbers.length - 1; i >= 0; i--) {
      if (numbers[i] != (i + 1)) {
        if (((i - 1) >= 0) && numbers[i - 1] == (i + 1)) {
          cont++;
          temp = numbers[i - 1];
          numbers[i - 1] = numbers[i];
          numbers[i] = temp;
        } else if (((i - 2) >= 0) && numbers[i - 2] == (i + 1)) {
          cont += 2;
          numbers[i - 2] = numbers[i - 1];
          numbers[i - 1] = numbers[i];
          numbers[i] = i + 1;
        } else {
          cont = -1;
          break;
        }
      }
    }
    print(cont == -1 ? 'Too chaotic' : cont);
  }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}
