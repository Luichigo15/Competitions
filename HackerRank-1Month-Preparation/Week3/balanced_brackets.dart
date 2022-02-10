import 'dart:collection';
import 'dart:io';

class Solution{
  void init(){
    final tests = int.parse(stdin.readLineSync()!);
    for (var i = 0; i < tests; i++) {
      print(_isBalanced(stdin.readLineSync()!));
    }
  }

  String _isBalanced(String brackets){
    if(brackets.startsWith(RegExp(r'[\]\}\)]'))) return 'NO';

    String char, result = 'YES';
    Stack<String> stack = Stack<String>();
    for (var i = 0; i < brackets.length; i++) {
      char = brackets[i];
      if(char =='{' || char == '[' || char == '(') stack.push(char);
      else if(
        !stack.isEmpty() && 
        ((char == ')' && stack.pop() != '(') ||
        (char == '}' && stack.pop() != '{') ||
        (char == ']' && stack.pop() != '['))
        ){
          result = 'NO';
          break;
      }
    }

    if(!stack.isEmpty()) result = 'NO';

    return result;
  }
}

class Stack<T>{
  final _stack = Queue<T>();

  void push(T element) => _stack.addLast(element);

  T pop(){
    final T lastElement = _stack.last;
    _stack.removeLast();
    return lastElement;
  }

  void clear() => _stack.clear();

  bool isEmpty() => _stack.isEmpty;
}

main(List<String> args) {
  final solution = Solution();
  solution.init();
}

// Java solution
// public static String isBalanced(String brackets) {
//   if(brackets.startsWith(")") || brackets.startsWith("]") || brackets.startsWith("}")) return "NO";    
//   char bracket;
//   String result = "YES";
//   Stack<Character> stack = new Stack<Character>();
//   for (int i = 0; i < brackets.length(); i++) {
//     bracket = brackets.charAt(i);
//     if(bracket =='{' || bracket == '[' || bracket == '(') stack.push(bracket);
//     else if(
//       !stack.empty() &&
//       ((bracket == ')' && stack.pop() != '(') ||
//       (bracket == '}' && stack.pop() != '{') ||
//       (bracket == ']' && stack.pop() != '['))
//       ){
//       result = "NO";
//       break;
//     }
//   }    
//   if(!stack.empty()) result = "NO";
//   return result;
// }