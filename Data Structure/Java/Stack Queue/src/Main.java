public class Main {

    public static void main(String[] args){
//        ArrayStack<Integer>  stack = new ArrayStack<>(11);
//        for (int i = 0 ;i < 5 ;i++){
//            stack.push(i);
//            System.out.println(stack);
//        }
//        stack.pop();
//        System.out.println(stack);


//        ArrayQueue<Integer> queue = new ArrayQueue<>(11);
//
//        for (int i = 0 ;i  < 10 ;i++){
//            queue.enqueue(i);
//            System.out.println(queue);
//        }
//        queue.dequeue();

        LoopQueue<Integer> queue = new LoopQueue<>(11);

        for (int i = 0 ;i  < 10 ;i++){
            queue.enqueue(i);
            System.out.println(queue);
        }

        for (int i = 0; i < 9;i++){
            queue.dequeue();
        }

        System.out.println(queue);
        System.out.println(String .format("capacity = %d",queue.getCapacity()));
        System.out.println(String.format("size = %d",queue.getSize()));
    }
}
