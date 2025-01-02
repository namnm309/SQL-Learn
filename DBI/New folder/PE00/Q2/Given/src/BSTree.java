
import java.io.*;
import java.util.*;

public class BSTree {

    Node root;

    // Default constructor
    BSTree() {
        this.root = null;
    }

    public boolean isEmpty() {
        return this.root == null;
    }

    public void clear() {
        this.root = null;
    }

    public void visit(Node p) {
        System.out.print("p.info: ");
        if (p != null) {
            System.out.println(p.getInfo() + " ");
        }
    }

    public void fvisit(Node p, RandomAccessFile f) throws Exception {
        if (p != null) {
            f.writeBytes(p.getInfo() + " ");
        }
    }

    public void breadth(Node p, RandomAccessFile f) throws Exception {
        if (p == null) {
            return;
        }
        Queue q = new Queue();
        q.enqueue(p);
        Node r;
        while (!q.isEmpty()) {
            r = q.dequeue();
            fvisit(r, f);

            if (r.left != null) {
                q.enqueue(r.left);
            }

            if (r.right != null) {
                q.enqueue(r.right);
            }
        }
    }

    public void preOrder(Node p, RandomAccessFile f) throws Exception {

        if (p == null) {
            return;
        }

        fvisit(p, f);
        preOrder(p.left, f);
        preOrder(p.right, f);
    }

    void inOrder(Node p, RandomAccessFile f) throws Exception {
        if (p == null) {
            return;
        }

        inOrder(p.left, f);
        fvisit(p, f);
        inOrder(p.right, f);
    }

    void postOrder(Node p, RandomAccessFile f) throws Exception {
        if (p == null) {
            return;
        }

        postOrder(p.left, f);
        postOrder(p.right, f);
        fvisit(p, f);
    }

    /**
     * Do NOT modify this method Load 3 lines of data from file: line k (for
     * owner), and line k+1 (for price), and line k+2 (for color)
     *
     * @param k the k-th line where data is started to be loaded
     */
    void loadData(int k) {
        String[] a = Lib.readLineToStrArray("data.txt", k);
        int[] b = Lib.readLineToIntArray("data.txt", k + 1);
        int[] c = Lib.readLineToIntArray("data.txt", k + 2);

        int n = a.length;
        for (int i = 0; i < n; i++) {
            insert(a[i], b[i], c[i]); // insert the new Node(a[i], b[i], c[i]) into the BST
        }
    }

    /**
     * Luy y: 1. SV KHONG su dung tieng Viet co dau trong bai lam de tranh Error
     * khi run chuong trinh. 2. Neu khong tuan thu se nhan diem 0 (khong).
     *
     * Question 2.1: use Bird’s price as the key attribute when building a BST.
     * implement the 'insert' method that inserts a new Node into the BST if the
     * attribute 'Price' of Bird is higher than zero (>0). The output of this
     * method will be written into the file 'f1.txt'. Therefore you should open
     * this file to see/test your code output. Example: with the content given
     * in the file 'data.txt', the content of 'f1.txt' after insertion should be
     * (A,7,9) (C,4,3) (B,9,4) (E,2,5) (Y,6,-7) (D,8,6) (E,2,5) (C,4,3) (Y,6,-7)
     * (A,7,9) (D,8,6) (B,9,4)
     *
     *
     * @param xOwner the owner of the input Bird
     * @param xPrice the price of the input Bird
     * @param xColor the color of the input Bird
     */
    void insert(String xOwner, int xPrice, int xColor) {
        //---------------------------------------------------------------------------------------
        //------ Start your code here------------------------------------------------------------
        if (xPrice <= 0) {
            return;
        }
        Bird newBird = new Bird(xOwner, xPrice, xColor);
        root = insertRec(root, newBird);

        //------ End your code here--------------------------------------------------------------
        //---------------------------------------------------------------------------------------
    }

    /**
     * A recursive function to insert a new node with data (e) into BST
     *
     * @param root : the root of the current sub-tree
     * @param e: data field
     * @return root node of the tree after insertion
     */
    private Node insertRec(Node root, Bird data) {
        /* If the tree is empty, then return a new node */
        if (root == null) {
            return new Node(data);
        } /**
         * If the value of the data being inserted is less than the value of the
         * current root node, then traverse to the left node of the current
         * root, and set the current left node to whatever gets returned from
         * the insert method
         */
        else if (data.getPrice() < root.getInfo().getPrice()) {
            root.left = insertRec(root.left, data);
        } /**
         * If the value of the data being inserted is less than the value of the
         * current root node,, then traverse to the right node of the current
         * root,, and set the current right node to whatever gets returned from
         * the insert method
         */
        else if (data.getPrice() > root.getInfo().getPrice()) {
            root.right = insertRec(root.right, data);
        } else {
            // This is emply to explicitly state that we do NOT 
            // allow insert duplicate keys into the tree.

        }
        /* return the (unchanged) node pointer */
        return root;
    }

    /**
     * Do NOT modify this method This is a helper method for writing data
     * (node's info) stored in the BST to file
     *
     * @throws Exception
     */
    void f1() throws Exception {
        clear();
        loadData(1);
        String fname = "f1.txt";
        File g123 = new File(fname);
        if (g123.exists()) {
            g123.delete();
        }
        RandomAccessFile f = new RandomAccessFile(fname, "rw");
        breadth(root, f);
        f.writeBytes("\r\n");
        inOrder(root, f);
        f.writeBytes("\r\n");
        f.close();
    }

    // This method is used for Question 2.2
    void f2() throws Exception {
        clear();
        loadData(5);
        String fname = "f2.txt";
        File g123 = new File(fname);
        if (g123.exists()) {
            g123.delete();
        }
        RandomAccessFile f = new RandomAccessFile(fname, "rw");
        breadth(root, f);
        f.writeBytes("\r\n");

        /**
         * Question 2.2: Perform breadth-first-search on the BST, but ONLY visit
         * nodes that has Bird's color higher than 5. Hint: This method is
         * similar to the method 'breadth' (provided in this class already). You
         * should create a new method which body is similar to 'breadth' for
         * doing BFS but considering only color higher than 5. The output f2()
         * will be written into the file 'f2.txt'. Therefore you should open
         * this file to see/test your code output. Example: With the data
         * provided in 'data.txt', the content of 'f2.txt' after running this
         * method is (C,8,2) (D,6,1) (E,9,4) (F,2,3) (G,7,8) (H,1,7) (I,3,9)
         * (J,5,5) (K,4,6) (G,7,8) (H,1,7) (I,3,9) (K,4,6)
         */
        //---------------------------------------------------------------------------------------
        //------ Start your code here------------------------------------------------------------
        if (root == null) {
            return;
        }
        Queue q = new Queue();
        q.enqueue(root);
        Node r;
        while (!q.isEmpty()) {
            r = q.dequeue();

            // Only visit nodes where Bird's color > 5
            if (r.getInfo().getColor() > 5) {
                f.writeBytes(r.getInfo() + " ");
            }

            if (r.left != null) {
                q.enqueue(r.left);
            }
            if (r.right != null) {
                q.enqueue(r.right);
            }
        }

        //------ End your code here--------------------------------------------------------------
        //---------------------------------------------------------------------------------------
        f.writeBytes("\r\n");
        f.close();
    }

    int getHeight(Node root) {
        if (root == null) {
            return 0;
        }
        int leftHeight = getHeight(root.left);
        int rightHeight = getHeight(root.right);
        return Math.max(leftHeight, rightHeight) + 1;
    }

    // This method is used for Question 2.3
    void f3() throws Exception {
        clear();
        loadData(9);
        String fname = "f3.txt";
        File g123 = new File(fname);
        if (g123.exists()) {
            g123.delete();
        }
        RandomAccessFile f = new RandomAccessFile(fname, "rw");
        postOrder(root, f);
        f.writeBytes("\r\n");
        /**
         * Question 2.3: Insert into the current tree a new Bird which Onwer =
         * 'XYZ', price = 100k, color = 200k, where k is height of the current
         * tree before insertion Hint: (1) Implement a method to calculate the
         * tree's height (2) Insert the new Bird('XYZ', 100*Tree Height,
         * 200*Tree Height) into the current tree The output f3() will be
         * written into the file 'f3.txt'. Therefore you should open this file
         * to see/test your code output. Example: With the data provided in
         * 'data.txt', the content of 'f3.txt' after running this method is
         * (H,1,7) (K,4,6) (J,5,5) (I,3,9) (F,2,3) (G,7,8) (D,6,1) (E,9,4)
         * (C,8,2) (H,1,7) (K,4,6) (J,5,5) (I,3,9) (F,2,3) (G,7,8) (D,6,1)
         * (XYZ,600,1200) (E,9,4) (C,8,2)
         */
        //---------------------------------------------------------------------------------------
        //------ Start your code here------------------------------------------------------------

        postOrder(root, f);
        f.writeBytes("\r\n");

        int height = getHeight(root);

        Bird newBird = new Bird("XYZ", 100 * height, 200 * height);
        root = insertRec(root, newBird);  // Insert the new node into the BST
        //------ End your code here--------------------------------------------------------------
        //---------------------------------------------------------------------------------------
        postOrder(root, f);
        f.writeBytes("\r\n");
        f.close();
    }

    // This method is used for Question 2.4
    void f4() throws Exception {
        clear();
        loadData(13);;
        String fname = "f4.txt";
        File g123 = new File(fname);
        if (g123.exists()) {
            g123.delete();
        }
        RandomAccessFile f = new RandomAccessFile(fname, "rw");
        postOrder(root, f);
        f.writeBytes("\r\n");
        /**
         * Question 2.4: Reset the Bird's color of all leaf Nodes to 100 Hint:
         * Leaf nodes have neither left child nor right child The output f4()
         * will be written into the file 'f4.txt'. Therefore you should open
         * this file to see/test your code output. Example: With the data
         * provided in 'data.txt', the content of 'f4.txt' after running this
         * method is (H,1,7) (K,4,6) (J,5,5) (I,3,9) (F,2,3) (G,7,8) (D,6,1)
         * (E,9,4) (C,8,2) (H,1,100) (K,4,100) (J,5,5) (I,3,9) (F,2,3) (G,7,100)
         * (D,6,1) (E,9,100) (C,8,2)
         */
        //---------------------------------------------------------------------------------------
        //------ Start your code here------------------------------------------------------------
        postOrder(root, f);
        f.writeBytes("\r\n");

        // Step 2: Reset the color of all leaf nodes to 100
        resetLeafColors(root);
        //------ End your code here--------------------------------------------------------------
        //---------------------------------------------------------------------------------------
        postOrder(root, f);
        f.writeBytes("\r\n");
        f.close();

    }

    void resetLeafColors(Node node) {
        if (node == null) {
            return;
        }

        // If the node is a leaf node, reset its color
        if (node.left == null && node.right == null) {
            node.getInfo().setColor(100); // Assuming Bird class has setColor method
        } else {
            // Recursively check the left and right subtrees
            resetLeafColors(node.left);
            resetLeafColors(node.right);
        }
    }
}
