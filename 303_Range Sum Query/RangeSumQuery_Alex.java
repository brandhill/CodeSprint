class NumArray {
    
    private int[] mTestNums;
    private int mTotal;

    public NumArray(int[] nums) {
        mTestNums = nums;
    }
    
    public int sumRange(int i, int j) {
        if((i < 0 || j < 0) || (i >= mTestNums.length || j >= mTestNums.length)) return 0;
        if(i > j) {
            return sumRange(j, i);
        }
        if(i == j) { return mTestNums[i]; }
        int total = 0;
        for(int index = i; index <= j ; index++) {
            total = total + mTestNums[index];
        }
        return total;
    }
}