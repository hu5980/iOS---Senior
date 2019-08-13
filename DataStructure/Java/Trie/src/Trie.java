import java.util.TreeMap;

public class Trie {

    private class Node {
        public  boolean isWord;
        public TreeMap<Character,Node> next;

        public Node(boolean isWord){
            this.isWord = isWord;
            next = new TreeMap<>();
        }
        public Node(){
            this(false);
        }
    }

    private  Node root;

    private int size;


    public Trie() {
        root = new Node();
        size = 0;
    }

    public int getSize(){
        return size;
    }


    /*向Trie 中添加新的单词Word*/
    public void add(String word) {
        Node cur = root;
        for (int i = 0; i < word.length();i++){
            char c = word.charAt(i);
            if (cur.next.get(c) == null){
                cur.next.put(c,new Node());
            }
            cur = cur.next.get(c);
        }

        if (!cur.isWord) {
            cur.isWord = true;
            size++;
        }
    }


    /*向Trie 中添加新的单词Word 递归写法*/
    public void addRecursion(String word){

    }

    public boolean contain(String word){
        Node cur = root;
        for (int i = 0; i < word.length();i++){
            char c = word.charAt(i);
            if (cur.next.get(c) == null){
                return false;
            }
            cur = cur.next.get(c);
        }
        return cur.isWord;
    }

    public boolean containRecursion(String word) {

        return false;
    }

    // 寻找前缀
    public boolean isPrefix(String prefix){
        Node cur = root;
        for (int i = 0; i < prefix.length();i++){
            char c = prefix.charAt(i);
            if (cur.next.get(c) == null){
                return false;
            }
            cur = cur.next.get(c);
        }
        return true;
    }


    public boolean search (String word){
        return match(root,word,0);
    }

    private boolean match(Node node,String word ,int index){

        if (index == word.length())
            return node.isWord;

        char c = word.charAt(index);

        if (c != '.'){
            if (node.next.get(c) == null)
                return false;
            match(node.next.get(c),word,index + 1);
        }else{
            for (char nextChar:node.next.keySet()){
                if (match(node.next.get(nextChar),word,index + 1))
                    return true;
                return false;
            }
        }
    }





}
