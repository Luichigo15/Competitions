import 'dart:io';

class Solution {
  void init() {
    print(_isValid(stdin.readLineSync()!));
  }

  String _isValid(String s) {
    String valid = 'YES';
    final notRepeted = s.split('').toSet();
    Map<int,int> results = {};
    late int temp;

    notRepeted.forEach((letter) {
      temp = s.split(letter).length-1;
      if(results.containsKey(temp)){
        results[temp] = results[temp]!+1;
      }else{
        results[temp] = 1;
      }

      if(results.length>2){
        valid = 'NO';
        return;
      }
    });
    if(valid!='NO' && results.length==2){
      final keys = results.keys.toList();
      final values = results.values.toList();
      values.sort();
      keys.sort();
      if((keys[1]-keys[0])>1){
        if(
          (keys[0]==1 && results[keys[0]]==1)
          || (keys[1]==1 && results[keys[1]]==1)
        ){

        }else{
          valid = 'NO';
        }
      }else{
        if(values[0]!=1){
          valid = 'NO';
        }
      }
    }

    return valid;
  }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}

// Java Solution
// public static String isValid(String s) {
//   String valid = "YES";
//   Set<String> notRepeted = new HashSet<String>(Arrays.asList(s.split("")));
//   Map<Integer, Integer> results = new HashMap<>();
//   int temp;
//   ArrayList<String> array = new ArrayList<String>(Arrays.asList(s.split("")));
//   for (String letter : notRepeted) {        
//     temp = (int)array.stream().filter(line -> letter.equals(line)).count();
//     if (results.containsKey(temp)) {
//         results.put(temp, results.get(temp) + 1);
//     } else {
//         results.put(temp, 1);
//     }
//     if (results.size() > 2) {
//         valid = "NO";
//         break;
//     }
//   }
//   if (!valid.equals("NO") && results.size() == 2) {
//     ArrayList<Integer> keys = new ArrayList<Integer>(results.keySet());
//     Collections.sort(keys);
//     if((keys.get(1)-keys.get(0))>1){
//       if(
//           (keys.get(0)==1 && results.get(keys.get(0))==1)
//         || (keys.get(1)==1 && results.get(keys.get(1))==1)
//       ){
//       }else{
//           valid = "NO";
//       }
//     }else{
//       if(values.get(0)!=1){
//           valid = "NO";
//       }
//     }
//   }
//   return valid;
// }
