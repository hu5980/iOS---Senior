public class Main {

    public static void main(String[] args){
//        ArrayStack<Integer>  stack = new ArrayStack<>(11);
//        for (int i = 0 ;i < 5 ;i++){
//            stack.push(i);
//            System.out.println(stack);
//        }
//        stack.pop();
//        System.out.println(stack);


        ArrayQueue<Integer> queue = new ArrayQueue<>(11);

        for (int i = 0 ;i  < 10 ;i++){
            queue.enqueue(i);
            System.out.println(queue);
        }

        queue.dequeue();

    }
}
