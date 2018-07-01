package com.leetcode.practice;

/**
 * Created by hill on 06/30/2018.
 * 
   Difficulty: Easy

   https://leetcode.com/problems/plus-one/description/

   Space : O(n)
   Time : O(n)
 */


import java.util.Arrays;

public class PlusOne {

    public static void Practice() {

        PlusOne exam = new PlusOne();

        int[] digits = {9, 9, 9};

        int[] answer = exam.plusOne(digits);

        Utils.debugLog(exam.getClass().getName() + ", answer : " + Arrays.toString(answer));
    }

    private int[] plusOne(int[] digits) {

        int len = digits.length;

        if (digits[len - 1] != 9) {
            digits[len - 1]++;
            return digits;
        }

        int carry = 1;
        int sum = 0;

        for (int i = len - 1; i >= 0; i--) {
            sum = digits[i] + carry;
            digits[i] = sum % 10;
            carry = sum / 10;
        }

        if (carry == 0) {
            return digits;
        } else {
            int[] answer = new int[len + 1];
            answer[0] = 1;
            return answer;
        }

    }

    private int[] plusOne2(int[] digits) {

        int n = digits.length;
        for (int i = n - 1; i >= 0; i--) {
            if (digits[i] < 9) {
                digits[i]++;
                return digits;
            }

            digits[i] = 0;
        }

        int[] newNumber = new int[n + 1];
        newNumber[0] = 1;

        return newNumber;
    }
}
