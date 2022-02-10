import 'dart:io';

class SinglyLinkedListNode {
  int data;
  SinglyLinkedListNode? next;

  SinglyLinkedListNode(this.data) {
    this.next = null;
  }
}

class SinglyLinkedList {
  SinglyLinkedListNode? head;
  SinglyLinkedListNode? tail;

  void insertNode(int nodeData) {
    SinglyLinkedListNode node = SinglyLinkedListNode(nodeData);

    if (this.head == null) {
      this.head = node;
    } else {
      this.tail!.next = node;
    }

    this.tail = node;
  }
}

class SinglyLinkedListPrintHelper {
  static printList(SinglyLinkedListNode? node) {
    String result = '';
    while (node != null) {
      result += node.data.toString() + ' ';
      node = node.next;
    }

    print(result);
  }
}

class Solution {
  void init() {
    final tests = int.parse(stdin.readLineSync()!);
    for (var i = 0; i < tests; i++) {
      SinglyLinkedList list = SinglyLinkedList();
      final numbers = int.parse(stdin.readLineSync()!);
      for (var i = 0; i < numbers; i++) {
        list.insertNode(int.parse(stdin.readLineSync()!));
      }
      SinglyLinkedListPrintHelper.printList(_reverse(list.head));
    }
  }

  SinglyLinkedListNode? _reverse(SinglyLinkedListNode? head) {
    SinglyLinkedListNode? prev = null, next;

    while (head != null) {
      next = head.next;
      head.next = prev;
      prev = head;
      head = next;
    }
    return prev;
  }
}

main() {
  final solution = Solution();
  solution.init();
}

// Java solution
// public static SinglyLinkedListNode reverse(SinglyLinkedListNode head) {
//   SinglyLinkedListNode prev = null, next;
  
//   while(head!=null){
//     next = head.next;
//     head.next = prev;
//     prev = head;
//     head = next;
//   }
//   return prev;
// }