public class Main {

    public static void main(String[] args) {
        BST<Integer> bst = new BST<>();
        int [] nums = {5,3,6,8,4,2};
        for (int num:nums) {
            bst.add(num);
        }
        System.out.println("前序遍历");
        bst.preOrder();
        System.out.println();
        System.out.println("前序非递归遍历");
        bst.preOrderNR();

        System.out.println();
        System.out.println();
        System.out.println("非递归前序遍历");
        bst.preOredrNO();

        System.out.println();
        System.out.println("中序遍历");
        //2分搜索树排序的结果 就是中序遍历
        bst.midOrder();

        System.out.println();
        System.out.println("后序遍历");
        //2分搜索树排序的结果 就是中序遍历
        bst.postOrder();

        System.out.println();
        System.out.println();
        System.out.println("层序遍历");
        bst.floorOrder();

        System.out.println("二叉树最小值");
        bst.miniNumNo();`

       // System.out.println(bst.toString());
    }
}
