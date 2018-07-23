import java.util.Stack;
public class BST <E extends Comparable<E>> {

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


    public void preOrderNR(){
        Stack<Node> stack = new Stack<>();
        stack.push(root);
        while (!stack.isEmpty()){
            Node cur = stack.pop();
            System.out.println(cur.e);

            if (cur.right != null)
                stack.push(cur.right);
            if (cur.left != null)
                stack.push(cur.left);
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

    private String generateDepthString(int depth){
        StringBuilder res = new StringBuilder();
        for (int i = 0; i < depth;i++){
            res.append("--");
        }
        return res.toString();
    }
}

