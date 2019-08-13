public class SegmentTree<E>  {

    private E[] tree;

    private E[] date;

    private Merger<E> merger;

    /*构造函数*/
    public SegmentTree(E[] arr,Merger<E> merger) {
        this.merger = merger;
        this.date = (E[])new Object[arr.length];
        for (int i = 0; i < arr.length;i++){
            date[i] = arr[i];
        }

        this.tree = (E[]) new Object[arr.length * 4];

        buildSegmentTree(0,0,date.length-1);
    }

    public E get(int index){
        if (index < 0 || index >= date.length)
            throw new  IllegalArgumentException("Index is illegal");
        return date[index];
    }

    public int getSize(){
        return date.length;
    }

    private int leftChild(int index){
        return 2*index + 1;
    }

    private int rightChild(int index){
        return 2*index + 2;
    }

    /*在treeIndex 的位置创建表示区间 [l...r]的线段树*/
    private void buildSegmentTree(int treeIndex,int l,int r){
        //表示已经到叶子节点了
        if (l==r){
            tree[treeIndex] = date[l];
            return;
        }

        int leftTreeIndex = leftChild(treeIndex);
        int rightTreeIndex = rightChild(treeIndex);

        int mid = l + (r-l) / 2;
        buildSegmentTree(leftTreeIndex,l,mid);
        buildSegmentTree(rightTreeIndex,mid+1,r);

        tree[treeIndex] = merger.merge(tree[leftTreeIndex],tree[rightTreeIndex]);
    }


    /*返回区间(queryL,queryR)的值*/
    public E query(int queryL,int queryR){
        if (queryL < 0 || queryL > queryR || queryL>=date.length || queryR < 0)
            throw new IllegalArgumentException("Index is Illega");

        return query(0,0,date.length-1,queryL,queryR);
    }

    private E query(int treeIndex,int l,int r,int queryL,int queryR){

        if (l == queryL && r == queryR){
            return tree[treeIndex];
        }
        int mid = l + (r-l) / 2;
        int leftTreeIndex = leftChild(treeIndex);
        int rightTreeindex = rightChild(treeIndex);

        if (queryL >= mid + 1){
            return query(rightTreeindex,mid+1,r,queryL,queryR);
        }else  if(queryR <= mid){
            return query(leftTreeIndex,l,mid,queryL,queryR);
        }

        E leftResult = query(leftTreeIndex,l,mid,queryL,mid);
        E rightResult =  query(rightTreeindex,mid+1,r,mid+1,queryR);

        return merger.merge(leftResult,rightResult);
    }

    @Override
    public String toString() {
        StringBuilder res = new StringBuilder();
        res.append('[');

        for (int i = 0; i < tree.length;i++){
            if (tree[i] != null)
                res.append(tree[i]);
            else
                res.append("null");
            if (i != tree.length - 1)
                res.append(", ");
        }
        res.append(']');
        return res.toString();
    }
}
