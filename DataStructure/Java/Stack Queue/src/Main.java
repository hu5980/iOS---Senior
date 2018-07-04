import org.omg.CORBA.INTERNAL;

import java.util.Random;
public class Main {

    private static double testQueue(Queue<Integer> q ,int opCount){
        long startTime = System.nanoTime();

        Random random = new Random();

        for (int i = 0; i < opCount;i++)
            q.enqueue(random.nextInt(Integer.MAX_VALUE));

        for (int i = 0; i < opCount;i++)
            q.dequeue();

        long endTime = System.nanoTime();

        return (endTime - startTime) / 1000000000.0;
    }


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



//        LoopQueue<Integer> queue = new LoopQueue<>(11);
//
//        for (int i = 0 ;i  < 10 ;i++){
//            queue.enqueue(i);
//            System.out.println(queue);
//        }
//
//        for (int i = 0; i < 9;i++){
//            queue.dequeue();
//        }
//
//        System.out.println(queue);
//        System.out.println(String .format("capacity = %d",queue.getCapacity()));
//        System.out.println(String.format("size = %d",queue.getSize()));

        int opCount = 100000;

        ArrayQueue<Integer> queue = new ArrayQueue<>(opCount);
        double queueTime = testQueue(queue,opCount);
        System.out.printf("非循环队列时间 = %f\n",queueTime);

        LoopQueue<Integer> loopqueue = new LoopQueue<>(opCount);
        double loopQueueTime = testQueue(loopqueue,opCount);
        System.out.printf("循环队列时间 = %f",loopQueueTime);

    }
}
