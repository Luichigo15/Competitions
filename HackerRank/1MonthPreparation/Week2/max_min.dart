import 'dart:io';

class Solution{
  void init(){
    final elementsSubArray = int.parse(stdin.readLineSync()!);
    List<int> numbers = List.from(
      stdin.readLineSync()!.split(' ').map((e) => int.parse(e))
    );

    print(_maxMin(elementsSubArray, numbers));
  }

  int _maxMin(int elementsSubArray, List<int> numbers){
    numbers.sort();
    int result = 0;
    List<int> subArray = [];
    for (var i = 0; i+elementsSubArray<=numbers.length; i++) {
      subArray = numbers.sublist(i,i+ elementsSubArray).toList(); 
      result = i==0?subArray.last-subArray.first:
                    subArray.last-subArray.first>result?
                    result:subArray.last-subArray.first;
    }

    return result;
  }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}

// Java solution
// public static int maxMin(int elementsSubArray, List<Integer> numbers) {
//   Collections.sort(numbers);
//   int result = 0;
//   List<Integer> subArray;
//   for (int i = 0; i+elementsSubArray<=numbers.size(); i++) {
//   subArray = numbers.subList(i,i+ elementsSubArray); 
//   result = i==0?subArray.get(subArray.size()-1)-subArray.get(0):
//                   subArray.get(subArray.size()-1)-subArray.get(0)>result?
//                   result:subArray.get(subArray.size()-1)-subArray.get(0);
//   }
//   return result;
// }