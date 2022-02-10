import 'dart:io';

class Solution {
  void init() {
    final length = int.parse(stdin.readLineSync()!);
    final sentence = stdin.readLineSync()!;
    final rotates = int.parse(stdin.readLineSync()!);

    print(_cesarCipher(sentence, rotates));

  }

  String _cesarCipher(String sentence, int rotates) {
    final limit = 'z'.codeUnitAt(0);
    final start = 'a'.codeUnitAt(0) - 1;
    final limit2 = 'Z'.codeUnitAt(0);
    final start2 = 'A'.codeUnitAt(0) - 1;
    String result = '';

    rotates = rotates>25?rotates%26:rotates;

    sentence.runes.forEach((asciiCode) => {
          if (String.fromCharCode(asciiCode).contains(RegExp(r'[a-zA-Z]')))
            {
              if (asciiCode >= start && asciiCode <= limit)
                {
                  result += String.fromCharCode(asciiCode + rotates > limit
                      ? start + asciiCode + rotates - limit
                      : asciiCode + rotates)
                }
              else
                {
                  result += String.fromCharCode(asciiCode + rotates > limit2
                      ? start2 + asciiCode + rotates - limit2
                      : asciiCode + rotates)
                }
            }
          else
            {result += String.fromCharCode(asciiCode)}
        });
    return result;
  }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}

//Java solution
// public static String caesarCipher(String s, int rotates) {
//   int limit = "z".codePointAt(0);
//   int start = "a".codePointAt(0) - 1;
//   int limit2 = "Z".codePointAt(0);
//   int start2 = "A".codePointAt(0) - 1;
//   String result = "";
//   rotates = rotates>25?rotates%26:rotates;
//   for(Character letter:s.toCharArray()){
//       if(Character.isLetter(letter)){
//           if ((int)letter >= start && (int)letter <= limit)
//               {
//               result += Character.toChars((int)letter + rotates > limit
//                   ? start + (int)letter + rotates - limit
//                   : (int)letter + rotates)[0];
//               }
//           else
//               {
//               result += Character.toChars((int)letter + rotates > limit2
//                   ? start2 + (int)letter + rotates - limit2
//                   : (int)letter + rotates)[0];
//               }
//       }else{
//           result += letter;
//       }
//   }
//   return result;
// }
