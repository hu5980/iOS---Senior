import java.util.ArrayList;

public class RBTree <K extends Comparable<K>,V> {

    private static final boolean RED = true;
    private static final boolean BLACK = false;

    private class Node {
        public K key;
        public V value;
        public Node left, right;
        public boolean color;

        public Node(K key, V value){
            this.key = key;
            this.value = value;
            left = null;
            right = null;
            color = RED;
        }
    }

    private Node root;
    private int size;

    public RBTree(){
        root = null;
        size = 0;
    }

    /*判断节点node 的颜色*/
    public boolean isRed(Node node) {
        if (node == null)
            return BLACK;
        return node.color;
    }

    /*左旋转*/
    private Node leftRotate(Node node){
        Node x = node.right;

        node.right = x.right;
        x.left = node;

        x.color = node.color;
        node.color = RED;
        return x;
    }

    /*右旋转*/
    private Node rightRotate(Node node) {
        Node x = node.left;

        node.left = x.right;
        x.right = node;

        x.color = node.color;
        node.color = RED;
        return x;
    }

    /*颜色的翻转*/
    private void flipColors(Node node){
        node.color = RED;
        node.left.color = BLACK;
        node.right.color = BLACK;
    }

    /*红黑树 添加节点*/
    private Node add(Node node ,K key,V value){
        if (node == null){
            size ++;
            return new Node(key, value);
        }
        if (key.compareTo(node.key) < 0){
            node.left = add(node.left,key,value);
        }else if (key.compareTo(node.key)> 0){
            node.right = add(node.right,key,value);
        }else {
            node.value = value;
        }

        return node;
    }

    public void add(K key, V value){
        add(root,key,value);
        root.color = BLACK;
    }


}
