import 'dart:collection';
import 'dart:io';

class Solution{
  void init(){
    SimpleTextEditor editor = SimpleTextEditor();
    final operations = int.parse(stdin.readLineSync()!);
    for (var i = 0; i < operations; i++) {
      final command = List.from(stdin.readLineSync()!.split(' '));
      switch (int.parse(command[0])) {
        case 1:
          editor.append(command[1]);
          break;
        case 2:
          editor.delete(int.parse(command[1]));
          break;
        case 3:
          editor.printT(int.parse(command[1]));
          break;
        case 4:
          editor.undo();
          break;
      }
    }
  }
}

class SimpleTextEditor{
  Stack<String> _text = Stack();

  void append(String w){
    _text.push(
      _text.isEmpty()?w:'${_text.getTop()}${w}'
    );
  }

  void printT(int k) => print(_text.getTop()[k-1]);

  void delete(int k) =>
    _text.push(_text.getTop().substring(0,_text.getTop().length-k));

  void undo() => _text.pop();
}

class Stack<T>{
  final _stack = Queue<T>();

  void push(T element) => _stack.addLast(element);

  T pop(){
    final T lastElement = _stack.last;
    _stack.removeLast();
    return lastElement;
  }

  T getTop() => _stack.last;

  void clear() => _stack.clear();

  bool isEmpty() => _stack.isEmpty;
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}

// Javascript solution
// let _text = [];

// function processData(input) {
//   let data = input.split('\n');
//   let command;
//   for(var i = 0; i<parseInt(data[0]); i++){
//     command = data[i+1].split(' ');
//     switch (command[0]) {
//     case '1':
//       append(command[1]);
//       break;
//     case '2':
//       deleteT(parseInt(command[1]));
//       break;
//     case '3':
//       printT(parseInt(command[1]));
//       break;
//     case '4':
//       undo();
//       break;
//     }
//   }
// } 

// function append(w){
//     _text.push(
//       _text.length==0?w:`${_text[_text.length-1]}${w}`
//     );
// }

// function printT(k) { 
//   console.log(_text[_text.length-1].charAt(k-1));
// }

// function deleteT( k) {
//   _text.push(_text[_text.length-1].substring(0,_text[_text.length-1].length-k));
// }

// function undo() {
//   _text.pop();
// }