import java.util.ArrayList;

public class BST<K extends Comparable<K>,V> {
    private class Node{
        public K key;
        public V value;
        public Node left,right;

        public Node(K key,V value){
            this.key = key;
            this.value = value;
            left = null;
            right = null;
        }
    }

    private Node root;
    private int size;

    public BST(){
        root = null;
        size = 0;
    }

    public int getSize(){
        return this.size;
    }

    public boolean isEmpty(){
        return size == 0;
    }

    // 返回以node为根节点的二分搜索树中，key所在的节点
    private Node getNode(Node node,K key){
        if (node == null){
            return null;
        }

        if (key.compareTo(node.key) == 0){
            return node;
        }else if (key.compareTo(node.key) < 0){
            return getNode(node.left,key);
        }else {
            return getNode(node.right,key);
        }
    }

    public boolean contains(K key){
        return getNode(root,key) != null;
    }

    // 向二分搜索树中添加新的元素(key, value)
    public void add(K key,V value){
        root = add(root,key,value);
    }

    private Node add(Node node,K key,V value){
        if (node == null){
            size++;
            return new Node(key,value);
        }

        if (key.compareTo(node.key) < 0){
            size++;
            node.left = add(node.left,key,value);
        }else if(key.compareTo(node.key) > 0){
            size++;
            node.right = add(node.right,key,value);
        }else{
            node.value = value;
        }
        return node;
    }

    public V get(K key){
        Node node = getNode(root,key);
        return node != null ? node.value : null;
    }

    public void set(K key,V newValue){
        Node node = getNode(root,key);
        if (node == null){
            throw new IllegalArgumentException(key + " doesn't exist!");
        }

        node.value = newValue;
    }

    // 删除掉以node为根的二分搜索树中的最小节点
    // 返回删除节点后新的二分搜索树的根
    private Node removeMin(Node node){
        if (node.left == null){
            Node rightNode = node.right;
            node.right = null;
            node = null;
            return rightNode;
        }
        node.left = removeMin(node.left);
        return node;
    }

    private Node minNode(Node node){
        if (node.left == null)
            return node;
        return minNode(node.left);
    }

    private Node remove(Node node,K key){
        if (node == null)
            return null;

        if (key.compareTo(node.key) < 0){
            return remove(node.left,key);
        }else if (key.compareTo(node.key) > 0){
            return remove(node.right,key);
        }else {
            if (node.left == null){
                Node rightNode = node.right;
                node.right = null;
                node = null;
                size --;
                return rightNode;
            }

            if (node.right == null){
                Node leftNode = node.left;
                node.left = null;
                node = null;
                size--;
                return leftNode;
            }

            Node rightMinNode = minNode(node.right);
            rightMinNode.right = removeMin(node.right);
            rightMinNode.left = node.left;
            node.left = null;
            node.right = null;
            return rightMinNode;
        }
    }

    public V remove(K key){
        Node node = remove(root,key);
        return node.value;
    }
}
