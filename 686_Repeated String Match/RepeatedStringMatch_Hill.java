class Solution {
    public int repeatedStringMatch(String A, String B) {
        if(A == null || A.length()<1 || B == null || B.length()<1 ){
			return -1;
		}
		int maxLoop = B.length() / A.length() + 1;
		StringBuilder sb = new StringBuilder();
		for(int i = 0; i<=maxLoop; i++){
			sb.append(A);
			if(sb.toString().contains(B)){
				return i+1;
			}
		}
		return -1;
    }
}