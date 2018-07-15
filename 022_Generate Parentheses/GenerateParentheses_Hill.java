//https://leetcode.com/articles/generate-parentheses/

class Solution {
    public List<String> generateParenthesis(int n) {
        
        List<String> result = new ArrayList<>();
        
        generate("", n, n , result);
     
        return result;
    }
    

    public static void generate(String str,int left,int right,List<String> list){
    	if (left > 0) {
    		generate(str+'(',left-1,right,list);
		}
    	if (left < right) {
    		generate(str+')',left,right-1,list);
		}
    	if (left == 0 && right == 0 ) {
    		list.add(str);
		}
    }    
    
}