public class Main {

    public static void main(String[] args) {
	// write your code here
//        LinkedList<Integer> list = new LinkedList<>();
//
//        for (int i = 0; i < 10 ;i++){
//            list.addFirst(i);
//        }
//
//        list.add(666,5);
//
//        System.out.printf(list.toString());
//        list.remove(2);
//        list.remove(2);
//        list.remove(2);
//        list.remove(2);
//
//        int e =  list.get(5);
//        System.out.format("\n%d",e);
//        System.out.format("\n%d",list.getLast());
//        list.contains(6);


        LinkedListQueue<Integer> queue = new LinkedListQueue<>();
        for (int i = 0; i < 10;i++){
            queue.enqueue(i);
            System.out.println(queue);
            if (i % 3 == 2){
                queue.dequeue();
                System.out.println(queue);
            }
        }


    }
}
