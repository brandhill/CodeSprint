class Solution {
    
    int[][] dirs = {{1,0}, {-1,0},{0,1},{0,-1} };
    
    public int numIslands(char[][] grid) {
        
        if (grid == null || grid.length == 0 || grid[0].length == 0){
            return 0;
        }
        
        int count = 0;
        
        
        for(int i = 0 ; i < grid.length ; i++){
            
            for(int j = 0 ; j < grid[0].length ; j++){
                
                if(grid[i][j] == '1'){
                    count ++;
                    merge(grid, i, j);
                }
               
            }
            
        }
        
        return count;
    }
    
    public void merge(char[][] grid, int i, int j) {
        
        // make sure in the grid
        
        int m = grid.length;
        int n = grid[0].length;
        
        if( i < 0 || i >= m || j < 0 || j >= n || grid[i][j] != '1'){
            return;
        }
        
        
        grid[i][j] = '0';
        
        for(int[]dir : dirs){
            merge(grid, i + dir[0], j + dir[1]);
        }
  
//         merge(grid, i -1, j);
//         merge(grid, i +1, j);
       
//         merge(grid, i, j - 1);
//         merge(grid, i, j + 1);

    }
    
}