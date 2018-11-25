

public class MedianofTwoSortedArrays_004 {


    class Solution {
        public double findMedianSortedArrays(int[] nums1, int[] nums2) {

            int lenA = nums1.length;
            int lenB = nums2.length;

            // lenA should be shorter
            if (lenA > lenB) {
                return findMedianSortedArrays(nums2, nums1);
            }


            int k = (lenA + lenB + 1) / 2;
            int left = 0, right = lenA;

            while (left < right) {

                int m1 = left + (right - left) / 2;
                int m2 = k - m1;

                if (nums1[m1] < nums2[m2 - 1]) {
                    left = m1 + 1;
                } else {
                    right = m1;
                }

            }


            int m1 = left;
            int m2 = k - left;


            int c1 = Integer.max(m1 <= 0 ? Integer.MIN_VALUE : nums1[m1 - 1],
                    m2 <= 0 ? Integer.MIN_VALUE : nums2[m2 - 1]);

            if ((lenA + lenB) % 2 == 1) {
                return c1;
            }

            int c2 = Integer.min(m1 >= lenA ? Integer.MAX_VALUE : nums1[m1],
                    m2 >= lenB ? Integer.MAX_VALUE : nums2[m2]);


            return (c1 + c2) * 0.5;
        }
    }
}
