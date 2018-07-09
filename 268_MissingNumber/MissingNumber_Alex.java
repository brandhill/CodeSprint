class Solution {
    public int missingNumber(int[] nums) {
         int maxNum = 0, minNum = 0;
        long totalNum = 0;
        int mLength = 0;
        for(int i = 0; i < nums.length; i++) {
            if (nums[i] < 0) continue;
            if(i == 0 || (nums[i] > 0 && nums[i] < minNum)) {
                minNum  = nums[i];
            }
            if(i == 0 || nums[i] > maxNum) {
                maxNum  = nums[i];
            }
            totalNum = totalNum + nums[i];
            mLength++;
        }
        return (int) (((mLength + 1) * mLength /2) - totalNum);
    }
}