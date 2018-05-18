
// E 本质表示类型  范型
public class Array<E> {
    private  E[] data;
    private  int size ;

    //构造函数 传入数组的容量 capacity
    public Array(int capacity){
        data = (E[])new Object[capacity];
        size = 0;
    }

    //无参数的构造函数
    public Array(){
       this(5);
    }

    public  int getSize(){
        return size;
    }

    public  int getCapacity(){
        return data.length;
    }

    public boolean isEmpty(){
        return  size == 0;
    }

    public  void addLast (E e) {
        add(size,e);
    }

    public  void addFirst(E e){
        add(0,e);
    }

    public void add(int index,E e) {

        if (index < 0 || index > size) throw new IllegalArgumentException("addLast fail,Requirl index > 0 && index <= size ");

        if(size == data.length){
            resize(2 * data.length);
        }

        for (int i = size -1 ;i >= index ;i--){
            data[i + 1] = data[i];
        }
        data[index] = e;
        size ++ ;
    }
    @Override
    public String toString(){
        StringBuilder res = new StringBuilder();
        res.append(String.format("Array:Size = %d ,capacity = %d \n",size,data.length));
        res.append('[');
        for ( int i = 0; i < size ;i++){
            res.append(data[i]);
            if (i != size -1){
                res.append(", ");
            }
        }
        res.append(']');
        return res.toString();
    }

    public E get(int index){
        if (index < 0 || index >= size) throw new IllegalArgumentException("Get failed,index is Illegal");
        return data[index];
    }

    public void set(int index , E e){
        if (index < 0 || index >= size) throw new IllegalArgumentException("Get failed,index is Illegal");
        data[index] = e;
    }

    public boolean contains(E e){
        for (int i= 0 ;i < size ;i++){
            if ( e.equals(data[i])){
                return  true;
            }
        }
        return  false;
    }


    public int find(E e){
        for (int i= 0 ;i < size ;i++){
            if (e.equals(data[i])){
                return  i;
            }
        }
        return -1;
    }

    public E remove(int index){
        if (index < 0 || index >= size )  throw new IllegalArgumentException("Get failed,index is Illegal");

        E ret = data[index];

        for (int i = index + 1 ;i < size ;i++ ){
            data[i - 1] = data[i];
        }
        data[size] = null;
        size--;
        if (size == data.length / 4  && data.length /2 != 0){
            resize(data.length/2);
        }

        return  ret;
    }

    public E removeFirst(){
        return  remove(0);
    }

    public E removeLast(){
        return  remove(size-1);
    }

    public boolean removeElement(E e){
        int index = find(e);
        if (index != -1) {
            remove(index);
            return  true;
        }
        return  false;
    }

    public  boolean removeAllElement(int e){
        return  false;
    }

    //扩容函数
    private void resize(int newCapacity){
        E[] newdata = (E[]) new Object[newCapacity];
        for (int i = 0; i < size ;i++)
                newdata[i] = data[i];

        data = newdata;
    }
}


