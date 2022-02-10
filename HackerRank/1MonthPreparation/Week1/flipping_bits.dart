import 'dart:io';
class Solution{
  void init(){
    final totalNumbers = int.parse(stdin.readLineSync()!);
    for (var i = 0; i < totalNumbers; i++) {
      stdout.writeln(_flippingBits(int.parse(stdin.readLineSync()!)));
    }
  }

  int _flippingBits(int n){
    //Respuesta Corta
    n = (~n).toUnsigned(32);
    return n;

    //Respuesta larga
    // String binary = (n).toRadixString(2);
    // String binaryF = '';
    // binary.runes.forEach((element) { 
    //   binaryF+=(String.fromCharCode(element)=='0'?'1':'0');
    // });
    // binaryF = binaryF.padLeft(32,'1');
    // return int.parse(binaryF,radix: 2);
  }
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}