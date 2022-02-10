import 'dart:io';
import 'dart:math';

/**
 * 
 * I want to explain especially this one, because is a little hard to understand.
 * In the first solutions (sumXor for dart and java solution 1):
 * I realized that foreach number that is power of two, the result is the same 
 * number, otherwise we need to count the 1's that the number has in its binary 
 * representation then subtract one (this one is because our final binary string must 
 * have a number 1 in its first position), and finally, take the length of the binary 
 * representation of the original number and subtract the count we did; the result of 
 * the subtract is the zeros to be padded to the right of out 1, at this point i did a 
 * lot of test and i didn't know why it works, just work and that's it,
 * 
 * 
 * Then i realized that if we do it the other way, counting zeros and using them as
 * a power of 2, we have the same result but quicker.
 * Why this work? Let me show you with an example:
 * We have n=79
 * Binary representation is 1001111, we'll call it as b
 * We have 2 0's
 * But it works because where b has 1, our results must have 1 too
 * and where b has 0, our results can have either 1 or 0
 * resulting as shown below
 * 1001111  1011111 1101111 1101111
 * These are all the posibilities, they are 4, 2^2 = 4
 * 
 * In both cases, zero is the only one that not follow these rules, it's always 1
 * because 2^0 is always 1
 * 
 * I wanted to explain this exercise because i think it's one of the most difficult
 * to understand, if it helps you let me know :)
 */

class Solution{
  void init(){
    print(_sumXor(
      BigInt.tryParse(stdin.readLineSync()!)!
      ));
  }

  BigInt _sumXor(BigInt n){
    if(n==0) return BigInt.from(1);
    final stringN = n.toRadixString(2);
    if(stringN.lastIndexOf('1')==0){
      return n;
    }else{
      return BigInt.tryParse('1'.padRight(
        stringN.length-(stringN.split('0').join().length-1),'0'
        ),radix: 2)!;
    }
  }

  BigInt _sumXor2(BigInt n)=>
    BigInt.from(
      n==0?
      1:pow(2, n.toRadixString(2).split('1').join().length)
      );
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}

// Java solution 1
// public static long sumXor(long n) {
//   if(n==0) return 1;
//   final String stringN = Long.toBinaryString(n);
//   if(stringN.lastIndexOf("1")==0){
//       return n;
//   }else{
//       return Long.parseLong(
//           String.format("%-" + (
//               stringN.length()-
//               (String.join("",stringN.split("0")).length()-1)
//             ) + "s", "1").replace(" ","0"),2
//       );
//   }    
// }

// Java solution 2
// public static long sumXor(long n) {
//   return (long)(n==0?1:Math.pow(2, String.join("",Long.toBinaryString(n).split("1")).length()));
// }
