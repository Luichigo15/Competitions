import 'dart:io';

class Solution{
  void init(){
    final total = int.parse(stdin.readLineSync()!);
    List<int> colors = List.from(
      stdin.readLineSync()!.split(" ").map((e) => int.parse(e))
    );
    print(_sockMerchant(total, colors));
  }

  int _sockMerchant(int total,List<int> colors){
    final notRepeated = colors.toSet();
    int totalPairs = 0;

    notRepeated.forEach((colorNotRepeated) { 
      totalPairs += 
        (colors.where((color) => color==colorNotRepeated).length/2).floor();
    });

    return totalPairs;
  }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}

//Java Solution
//My first solution
// public static int sockMerchant(int n, List<Integer> colors) {
//   Collections.sort(colors);
//   Set<Integer> notRepeated = new TreeSet<Integer>(colors);
//   int totalPairs = 0;
//   int tempCount;
//   for(Integer colorNotRepeated:notRepeated){
//     tempCount = 0;
//     for(Integer color: colors){
//         if(color != colorNotRepeated) continue;
//         tempCount++;
//     }        
//     totalPairs += (int)Math.floor(tempCount/2);    
//   }
//   return totalPairs;
// }

// Best solution
// public static int sockMerchant(int n, List<Integer> colors) {
//   HashMap<Integer,Integer> counts = new HashMap<Integer,Integer>();
//   for(Integer color:colors){
//       counts.put(color,counts.get(color)==null?1:counts.get(color)+1);
//   }
//   int totalPairs = 0;
//   for(Integer count:counts.values()){
//       totalPairs += (int)Math.floor(count/2);
//   }    
//   return totalPairs;
// }