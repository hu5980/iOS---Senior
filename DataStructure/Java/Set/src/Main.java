import java.util.ArrayList;
import java.util.Random;

public class Main {

    static public void bstSet() {

        double startTime = System.nanoTime();

        System.out.println("pride and prejudice");

        ArrayList<String> words1 = new ArrayList<>();

        FileOperation.readFile("pride-and-prejudice.txt",words1);

        System.out.println("Total words:" +words1.size());


        BSTSet<String> set1 = new BSTSet<>();

        for (String word:words1){
            set1.add(word);
        }
        System.out.println("Total differwnt words :" + set1.getSize());


        System.out.println("a tale of two cities");

        ArrayList<String> words2 = new ArrayList<>();

        FileOperation.readFile("a-tale-of-two-cities.txt",words2);

        System.out.println("Total words:" +words2.size());


        BSTSet<String> set2 = new BSTSet<>();

        for (String word:words2){
            set2.add(word);
        }
        System.out.println("Total differwnt words :" + set2.getSize());

        double endTime = System.nanoTime();

        System.out.println("二叉搜索树 花费的时间 " + (endTime - startTime) / 1000000000.0 + " s");
    }

    static public void listedSet() {
        double startTime = System.nanoTime();
        System.out.println("pride and prejudice");

        ArrayList<String> words1 = new ArrayList<>();

        FileOperation.readFile("pride-and-prejudice.txt",words1);

        System.out.println("Total words:" +words1.size());


        LinkedListSet<String> set1 = new LinkedListSet<>();

        for (String word:words1){
            set1.add(word);
        }
        System.out.println("Total differwnt words :" + set1.getSize());


        System.out.println("a tale of two cities");

        ArrayList<String> words2 = new ArrayList<>();

        FileOperation.readFile("a-tale-of-two-cities.txt",words2);

        System.out.println("Total words:" +words2.size());


        LinkedListSet<String> set2 = new LinkedListSet<>();

        for (String word:words2){
            set2.add(word);
        }
        System.out.println("Total differwnt words :" + set2.getSize());

        double endTime = System.nanoTime();

        System.out.println("链表 花费的时间 " + (endTime - startTime) / 1000000000.0 + " s");
    }



    static public void linkedMap() {

        double startTime = System.nanoTime();

        System.out.println("pride and prejudice");

        ArrayList<String> words1 = new ArrayList<>();

        FileOperation.readFile("pride-and-prejudice.txt",words1);

        System.out.println("Total words:" +words1.size());


        LinkedListMap<String,Integer> map = new LinkedListMap<>();

        for (String word:words1){
            if (map.contains(word))
                map.set(word,map.get(word) + 1);
            else
                map.add(word,1);
        }

        System.out.println("Total differwnt words :" + map.getSize());
        System.out.println("Total pride words :" + map.get("pride"));
        System.out.println("Total pride words :" + map.get("like"));

        double endTime = System.nanoTime();

        System.out.println("链表 Map 执行时间 " + (endTime - startTime) / 1000000000.0 + " s");
    }


    static public void BSTMap() {

        double startTime = System.nanoTime();

        System.out.println("pride and prejudice");

        ArrayList<String> words1 = new ArrayList<>();

        FileOperation.readFile("pride-and-prejudice.txt",words1);

        System.out.println("Total words:" +words1.size());



        BSTMap<String,Integer> map = new BSTMap<>();

        for (String word:words1){
            if (map.contains(word))
                map.set(word,map.get(word) + 1);
            else
                map.add(word,1);
        }

        System.out.println("Total differwnt words :" + map.getSize());
        System.out.println("Total pride words :" + map.get("pride"));
        System.out.println("Total pride words :" + map.get("like"));

        double endTime = System.nanoTime();

        System.out.println("树 Map 执行时间 " + (endTime - startTime) / 1000000000.0 + " s");
    }



    public static void main(String[] args) {
//        System.out.println("使用二叉搜索树 进行插入");
//        bstSet();
//
//        System.out.println("使用链表 进行插入");
//        listedSet();


        System.out.println("使用链表 进行插入");
        linkedMap();

        System.out.println("使用二叉树 进行插入");
        BSTMap();
    }


}
