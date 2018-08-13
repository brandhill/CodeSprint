/**
 * Definition for an interval.
 * public class Interval {
 *     int start;
 *     int end;
 *     Interval() { start = 0; end = 0; }
 *     Interval(int s, int e) { start = s; end = e; }
 * }
 */
class Solution {
    public List<Interval> merge(List<Interval> intervals) {
        
        List<Interval> result = new ArrayList<>();
        
        if(intervals == null){
            return result;
        }else if(intervals.size() <= 1){
            return intervals;
        }
       
        Collections.sort(intervals,new Comparator<Interval>(){
           @Override
           public int compare(final Interval lhs,Interval rhs) {

               return lhs.start - rhs.start;
             // return 1 if rhs should be before lhs 
             // return -1 if lhs should be before rhs
             // return 0 otherwise
             }
         });    
        
        int start = intervals.get(0).start;
        int end = intervals.get(0).end;
        
        for(int i = 1, z = intervals.size(); i < z ; i++){
            if(end >= intervals.get(i).start){
                end = Math.max(intervals.get(i).end, end);
            }else{
                
                result.add(new Interval(start, end));
                
                start = intervals.get(i).start;
                end = intervals.get(i).end;
                
            }
        }
        
        result.add(new Interval(start, end));
       
        return result;
        
    }
}