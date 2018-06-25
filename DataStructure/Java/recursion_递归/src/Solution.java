public class Solution {


    public ListNode removeElements_1(ListNode head, int val) {

        while(head != null && head.val == val){
            ListNode delNode = head;
            head = head.next;
            delNode.next = null;
        }

        if(head == null)
            return head;

        ListNode prev = head;
        while(prev.next != null){
            if(prev.next.val == val) {
                ListNode delNode = prev.next;
                prev.next = delNode.next;
                delNode.next = null;
            }
            else
                prev = prev.next;
        }

        return head;
    }


    public ListNode removeElements_2(ListNode head, int val) {

        while(head != null && head.val == val)
            head = head.next;

        if(head == null)
            return head;

        ListNode prev = head;
        while(prev.next != null){
            if(prev.next.val == val)
                prev.next = prev.next.next;
            else
                prev = prev.next;
        }

        return head;
    }


    public ListNode removeElements_3(ListNode head ,int val){
        if (head == null)
                return  null;
        head.next = removeElements_3(head.next,val);
        return head.val == val ? head.next :head;
//        ListNode res = removeElements(head.next,val);
//
//        if (head.val == val){
//            return res;
//        }else{
//            head.next = res;
//            return head;
//        }
    }

    public static void main(String[] args){
        int [] nums = {6,6,6,1,2,6,3,4,5,6};
        ListNode head = new ListNode(nums);
        System.out.println(head);

        ListNode res = (new Solution()).removeElements_3(head,6);
        System.out.println(res);
    }
}



