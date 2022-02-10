import 'dart:io';

class Solution{
  void init(){
    final List<int> numbers = List.from(
      (stdin.readLineSync()!).split(" ").map((e) => int.parse(e))
    );

    print(_countingSort(numbers));
  }

  List<int> _countingSort(List<int> array){
    List<int> counter = List.filled(100, 0);
    array.forEach((number) { counter[number]++;});

    return counter;
  }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}

// Java Solution
// public static List<Integer> countingSort(List<Integer> arr) {
//   Integer[] counter = new Integer[100];
//   Arrays.fill(counter, 0);
//   for(int i=0; i<arr.size();i++){
//       counter[arr.get(i)]++;
//   }
//   return Arrays.asList(counter);
// }