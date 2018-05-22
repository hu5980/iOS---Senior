public class LinkedList<E> {

    private class Node{
        public E e;
        public Node next;

        //构造函数
        public Node(E e ,Node next){
            this.e = e;
            this.next = next;
        }

        public Node (E e){
            this(e,null);
        }

        public Node(){
            this(null,null);
        }

        @Override
        public String toString() {
            return e.toString();
        }
    }

    private Node dummyHead;


    private int size;

    public LinkedList(){
        dummyHead = new Node(null,null);
        size = 0;
    }

    public int getSize(){
        return size;
    }

    public boolean isEmpty(){
        return  size == 0;
    }

    //链表头添加新的元素
    public void addFirst(E e){
        add(e,0);
    }

    //在链表的 index 位置 添加元素
    public void add(E e, int index){
        if (index < 0 || index > size) throw new IllegalArgumentException("Add failed ,Illegal index");

        Node prev = dummyHead;
        for (int i = 0 ; i < index ;i++){
            prev = prev.next;
        }
        prev.next = new Node(e,prev.next);

        size ++;
    }

    public void addLast(E e){
        add(e,size);
    }

    @Override
    public String toString() {
        StringBuilder res = new StringBuilder();
        res.append("Link list:");
        Node cur = dummyHead.next;
        while (cur != null){
            res.append(cur.e);
            res.append("->");
            cur = cur.next;
        }
        res.append("->NULL");
        return  res.toString();
    }

    public E get(int index){
        if (index < 0 || index >= size) throw new IllegalArgumentException("Add failed ,Illegal index");
        Node cur = dummyHead.next;
        for (int i = 0 ; i < index;i++){
            cur = cur.next;
        }

        return cur.e;
    }

    public E getFirst(){
       return   get(0);
    }

    public E getLast(){
        return  get(size - 1);
    }

    //设置链表中的元素
    public void set(int index ,E e){
        if (index < 0 || index >= size) throw new IllegalArgumentException("Add failed ,Illegal index");

        Node cur = dummyHead.next;

        for (int i = 0;  i < index;i++){
            cur = cur.next;
        }
        cur.e = e;
    }

    //查找链表中的元素
    public boolean contains(E e){
        Node cur = dummyHead.next;
        while (cur.next != null){
            if (cur.e == e){
                return true;
            }
            cur = cur.next;
        }
        return false;
    }

    public E remove(int index){
        if (index < 0 || index > size) throw new IllegalArgumentException("Add failed ,Illegal index");
        Node prev = dummyHead;
        for (int i = 0 ; i < index ;i++){
            prev = prev.next;
        }
        Node deleteNode = prev.next;
        prev.next = deleteNode.next;
        deleteNode.next = null;
        size --;
        return  deleteNode.e;
    }

    public E removeFirst(){
        return remove(0);
    }

    public E removeLast(){
        return remove(size);
    }

}
