import java.util.Stack;

/**
 * Created by hill on 06/30/2018.
 * 
   Difficulty: Easy

   https://leetcode.com/problems/valid-parentheses/description/

   Space : O(n)
   Time : O(n)
 */
public class ValidParentheses {

    public boolean isValid(String s) {

        Stack<Character> stack = new Stack<>();

        for (int i = 0; i < s.length(); i++) {

            char curChar = s.charAt(i);

            if (curChar == '(' || curChar == '[' || curChar == '{') {
                stack.push(curChar);

            } else if (curChar == ')' && !stack.isEmpty() && stack.peek() == '(') {
                stack.pop();
            } else if (curChar == ']' && !stack.isEmpty() && stack.peek() == '[') {
                stack.pop();
            } else if (curChar == '}' && !stack.isEmpty() && stack.peek() == '{') {
                stack.pop();
            } else {
                return false;
            }
        }

        return stack.isEmpty();
    }

}
