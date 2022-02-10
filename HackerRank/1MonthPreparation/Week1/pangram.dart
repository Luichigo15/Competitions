import 'dart:io';

class Solution{
  void init(){
    final sentence = stdin.readLineSync()!;

    print(_pangram(sentence));
  }

  String _pangram(String sentence)=>
      sentence.replaceAll(' ','').toLowerCase().split('').toSet().length==26?'pangram':'not pangram';

//Long answer
//String _pangram(String sentence){
    // final alphabet = ['a','b','c','d','e','f','g','h','i','j',
    //       'k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
    
    // bool isPangram = true;
    // alphabet.forEach((element) { 
    //   if(!sentence.toLowerCase().contains(element)){
    //     isPangram = false;
    //     return;
    //   }
    // });

    // return isPangram?'pangram':'not pangram';
  //}
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}

// Java Solution
// public static String pangrams(String s) {
//   char[] alphabet = new char[]{'a','b','c','d','e','f','g','h','i','j',
//         'k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};

//   boolean isPangram = true;
//   for(int i=0;i<alphabet.length;i++){
//     if(!s.toLowerCase().contains(String.valueOf(alphabet[i]))){
//       isPangram = false;
//       break;
//     }  
//   }

//   return isPangram?"pangram":"not pangram";
// }

// Java short solution
// public static void pangram() throws IOException{
//   BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
//   String s = bufferedReader.readLine();
//   List<String> listS = new ArrayList<String>(Arrays.asList(s.toLowerCase().replaceAll("\\s","").split("")));
//   Set<String> set = new HashSet<>(listS);
//   listS.clear();
//   listS.addAll(set);
//   System.out.println(listS.size()==26?"pangram":"not pangram");
// }