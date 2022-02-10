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
      SinglyLinkedList list = SinglyLinkedList();
      final numbers = int.parse(stdin.readLineSync()!);
      for (var i = 0; i < numbers; i++) {
        list.insertNode(int.parse(stdin.readLineSync()!));
      }
      SinglyLinkedList.printList(
        _insertNodeAtPosition(
          list.head,int.parse(stdin.readLineSync()!),int.parse(stdin.readLineSync()!)
          )
        );
  }

  SinglyLinkedListNode? _insertNodeAtPosition(SinglyLinkedListNode? head,int data,int position) {
    SinglyLinkedListNode? current = head;

    while(current != null && position!=1){
      current = current.next;
      position--;
    }

    SinglyLinkedListNode? temp = current!.next;
    SinglyLinkedListNode newNode = SinglyLinkedListNode(data);
    newNode.next = temp;
    current.next = newNode;

    return head;
  }
}

main() {
  final solution = Solution();
  solution.init();
}

// Java solution
// public static SinglyLinkedListNode insertNodeAtPosition(SinglyLinkedListNode head, int data, int position) {
//   SinglyLinkedListNode current = head;
//   while(current != null && position!=1){
//     current = current.next;
//     position--;
//   }
//   SinglyLinkedListNode temp = current.next;
//   SinglyLinkedListNode newNode = new SinglyLinkedListNode(data);
//   newNode.next = temp;
//   current.next = newNode;
//   return head;
// }