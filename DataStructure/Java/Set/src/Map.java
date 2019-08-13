
/*定义一个Map的接口*/
public interface Map<K,V> {

    void add(K key,V value);

    V get(K key);

    V remove(K key);

    boolean contains(K key);

    void set(K key,V newValue);



    int getSize();

    boolean isEmpty();
}
