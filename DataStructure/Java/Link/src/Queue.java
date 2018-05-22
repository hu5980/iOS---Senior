public interface Queue<E> {
    void enqueue(E e);  //入队
    E dequeue();      //出队
    E getFront();      //获取队首的元素
    int getSize();
    boolean isEmpty();
}
