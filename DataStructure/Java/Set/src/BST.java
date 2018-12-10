import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

public class BST<E extends Comparable<E>> {

    private class Node {

        public Node left,right;
        public E e;

        public Node(E e){
            this.e = e;
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

    public int size(){
        return size;
    }

    public boolean isEmpty(){
        return size == 0;
    }

    public void add(E e) {
//        if (root == null) {
//            root = new Node(e);
//            size ++;
//        }else {
//            add(root,e);
//        }

        root = addOne(root,e);
    }

    private void add(Node node, E e) {
        if (e.equals(node.e)) {
            return;
        }else  if (e.compareTo(node.e) < 0 && node.left == null){
            node.left = new Node(e);
            size++;
            return;
        }else if (e.compareTo(node.e) > 0 && node.right == null){
            node.right = new Node(e);
            size++;
            return;
        }

        if (e.compareTo(node.e) < 0)
            add(node.left,e);
        else
            add(node.right,e);
    }

    private Node addOne(Node node, E e) {
        if (node == null){
            size++;
            return new Node(e);
        }
        if (e.compareTo(node.e) < 0)
            node.left = addOne(node.left,e);
        else if (e.compareTo(node.e) > 0)
            node.right = addOne(node.right,e);
        return node;
    }

    public boolean contains(E e) {
        return contains(root,e);
    }

    //查找
    private boolean contains(Node node ,E e) {
        if (node == null)
            return  false;
        if(e.compareTo(node.e) == 0)
            return false;
        else if (e.compareTo(node.e) < 0)
            return contains(node.left,e);
        else
            return contains(node.right,e);
    }

    //前序遍历
    public void preOrder() {
        preOrder(root);
    }

    //前序遍历
    private void preOrder(Node node){
        if (node == null)
            return;
        System.out.println(node.e);
        preOrder(node.left);
        preOrder(node.right);
    }

    public void preOredrNO(){
        Stack<Node> stack = new Stack<>();
        stack.push(root);
        while (!stack.isEmpty()){
            Node cur = stack.pop();
            System.out.println(cur.e);

            if (cur.right != null){
                stack.push(cur.right);
            }
            if (cur.left != null){
                stack.push(cur.left);
            }
        }
    }

    public void midOrder(){
        midOrder(root);
    }

    private void midOrder(Node node){
        if (node == null)
            return;

        midOrder(node.left);
        System.out.println(node.e);
        midOrder(node.right);
    }

    public void postOrder(){
        postOrder(root);
    }

    private void postOrder(Node node){
        if (node == null){
            return;
        }
        postOrder(node.left);
        postOrder(node.right);
        System.out.println(node.e);

    }

    public void midSort(){
        midSort(root);
    }

    private void midSort(Node node){
        if (node == null){
            return;
        }
        midSort(node.left);
        System.out.println(node.e);
        midSort(node.right);
    }

    public void floorOrder() {
        Queue<Node> queue = new LinkedList<>();
        queue.add(root);
        while (!queue.isEmpty()){
            Node cur = queue.poll();
            System.out.println(cur.e);

            if (cur.left != null){
                queue.add(cur.left);
            }

            if (cur.right != null){
                queue.add(cur.right);
            }
        }
    }

    public E mininum(){
        if (size == 0){
            throw new IllegalArgumentException("BST is empty");
        }
        return mininum(root).e;
    }

    private Node mininum(Node node){
        if (node.left == null) {
            System.out.println(node.e);
            return  node;
        }
        return mininum(node.left);
    }

    public E miniNumNo() {
        if (size == 0){
            throw new IllegalArgumentException("BST is empty");
        }
        Node cur = root;
        while (cur.left != null){
            cur = cur.left;
        }
        System.out.println(cur.e);
        return  cur.e;
    }

    public E maxnum(){
        if (size == 0){
            throw new IllegalArgumentException("BST is empty");
        }
        return maxnum(root);
    }

    private E maxnum(Node node){
        if (node.right == null) {
            return  node.e;
        }
        return maxnum(node.right);
    }

    //从二分搜索树中删除最小值 并返回这个最小值
    public  E removeMin() {
        E ret = mininum();
        root =  removeMin(root);
        return ret;
    }

    private Node removeMin(Node node){
        if (node.left == null){
            Node rightNode = node.right;
            node.right = null;
            size --;
            return rightNode;
        }
        node.left = removeMin(node.left);
        return node;
    }

    public E removeMax(){
        E ret = removeMax();
        root = removeMax(root);
        return  ret;
    }

    private Node removeMax(Node node){
        if (node.right == null){
            Node leftNode = node.left;
            node.left = null;
            size--;
            return leftNode;
        }
        node.right = removeMax(node.right);
        return  node;
    }

    @Override
    public String toString() {
        StringBuilder res = new StringBuilder();
        generateBSTString(root ,0, res);
        return  res.toString();
    }

    private void generateBSTString(Node node ,int depth,StringBuilder res){
        if (node == null){
            res.append(generateDepthString(depth) + "null\n");
            return;
        }
        res.append(generateDepthString(depth) + node.e + "\n");
        generateBSTString(node.left,depth + 1,res);
        generateBSTString(node.right,depth + 1,res);

    }

    public void remove(E e){
        root = remove(root,e);
    }
    private Node remove(Node node,E e){
        if (node == null){
            return null;
        }

        if (e.compareTo(node.e) < 0){
            node.left = remove(node.left,e);
            return node.left;
        }else if (e.compareTo(node.e) > 0){
            node.right = remove(node.right,e);
            return node.right;
        }else{
            if (node.left == null){
                Node rightNode = node.right;
                node.right = null;
                size --;
                return rightNode;
            }else if (node.right == null){
                Node leftNode = node.left;
                node.left = null;
                size --;
                return leftNode;
            }else{
                Node successor = mininum(node.right);
                successor.right = removeMin(node.right);
                successor.left = node.left;

                node.left = node.right = null;
                return successor;
            }
        }
    }

    private String generateDepthString(int depth){
        StringBuilder res = new StringBuilder();
        for (int i = 0; i < depth;i++){
            res.append("--");

        }
        return res.toString();
    }
}

