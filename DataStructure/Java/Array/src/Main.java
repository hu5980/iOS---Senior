public class Main {


    //数组的最大有点 ：快速查询
    //数组最好应用于"索引有语义的时候"
    //并非所有有语义的索引都适合用于数组

    public static void main(String[] args) {
	// write your code here

//        int[] arr = new int[10];
//
//        for (int i = 0 ;i < arr.length ;i++){
//            arr[i] = i;
//        }
//
//        int[] scores = new int[]{100,99,66};
//
//        for (int i = 0; i< scores.length ;i++){
//            System.out.println(scores[i]);
//        }
//
//        for (int score:scores){
//            System.out.println(score);
//        }
//
//        scores[0] = 98;
//
//
//        for (int score:scores){
//            System.out.println(score);
//        }

        Array<Integer> arr = new Array<>(20);

        for (int i = 0 ;i< 500 ;i++){
            arr.addLast(i);
        }

        System.out.println(arr);
        System.out.println(arr.getSize());
        System.out.println(arr.getCapacity());
//        arr.add(1,100);
//        arr.addFirst(-1);
//        arr.addLast(-2);
//        System.out.println(arr);
//        System.out.println(arr.getSize());
//
//        arr.removeElement(2);
//        System.out.println(arr.getSize());
//
//        arr.removeLast();
//        System.out.println(arr.getSize());
//
//        arr.removeFirst();
//        System.out.println(arr);


    }
}
