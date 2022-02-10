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
    final tests = int.parse(stdin.readLineSync()!);
    for (var i = 0; i < tests; i++) {
      SinglyLinkedList list = SinglyLinkedList();
      SinglyLinkedList list2 = SinglyLinkedList();
      int numbers = int.parse(stdin.readLineSync()!);
      for (var i = 0; i < numbers; i++) {
        list.insertNode(int.parse(stdin.readLineSync()!));
      }
      numbers = int.parse(stdin.readLineSync()!);
      for (var i = 0; i < numbers; i++) {
        list2.insertNode(int.parse(stdin.readLineSync()!));
      }
      SinglyLinkedList.printList(_mergeLists(list.head,list2.head));
    }
  }

  SinglyLinkedListNode? _mergeLists(SinglyLinkedListNode? head1,SinglyLinkedListNode? head2) {
    SinglyLinkedList list = SinglyLinkedList();

    while (head2!=null && head1!=null){
      if(head1.data<=head2.data){
        list.insertNode(head1.data);
        head1 = head1.next;
      }else{
        list.insertNode(head2.data);
        head2 = head2.next;
      }
     
    }

    if(head2==null){
      while(head1!=null){
        list.insertNode(head1.data);
        head1 = head1.next;
      }
    }else{
      while(head2!=null){
        list.insertNode(head2.data);
        head2 = head2.next;
      }
    }
    return list.head;
  }
}

main() {
  final solution = Solution();
  solution.init();
}

// Java solution
// static SinglyLinkedListNode mergeLists(SinglyLinkedListNode head1, SinglyLinkedListNode head2) {
//   SinglyLinkedList list = new SinglyLinkedList();
//   while (head2!=null && head1!=null){
//     if(head1.data<=head2.data){
//       list.insertNode(head1.data);
//       head1 = head1.next;
//     }else{
//       list.insertNode(head2.data);
//       head2 = head2.next;
//     }
   
//   }
//   if(head2==null){
//     while(head1!=null){
//       list.insertNode(head1.data);
//       head1 = head1.next;
//     }
//   }else{
//     while(head2!=null){
//       list.insertNode(head2.data);
//       head2 = head2.next;
//     }
//   }
//   return list.head;
// }