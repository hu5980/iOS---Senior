public class UnionFind1 implements  UF{

    /*数组用来存储序号 ，数组编号表示是第几号元素 这个就是第几号元素的编号  */
    private int[] id;

    public UnionFind1(int size){
        id = new int[size];

        for (int i = 0; i < id.length;i++){
            id[i] = i;
           // System.out.println("i = " + i);
        }
    }


    @Override
    public int getSize() {
        return id.length;
    }

    /*查找元素p所对应的集合的编号*/
    private int find(int p){
        return id[p];
    }

    @Override
    public boolean isConnected(int p, int q) {
        return find(p) == find(q);
    }


    @Override
    public void unionElements(int p, int q) {

        int pID = find(p);
        int qID = find(q);

        if (pID == qID)
            return;

        for (int i =0 ;i < id.length;i++){
            if (id[i] == pID)
                id[i] = qID;
        }
    }
}
