class Solution {
    public int[] anagramMappings(int[] A, int[] B) {
        HashMap<Integer, Integer> map = new HashMap<>();
        
        for(int i = 0, z = B.length ; i < z ; i ++){
            map.put(B[i], i);
        }
        
        int[] result = new int[B.length];
        
        for(int i = 0, z = A.length ; i < z ; i ++){
            result[i] = map.get(A[i]);
        }
            
        return result;
    }
}