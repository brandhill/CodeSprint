public class Solution {
    public boolean wordBreak(String s, List<String> wordDict) {
        if (s == null || s.isEmpty() || wordDict == null || wordDict.isEmpty()) {
            return false;
        }

        boolean[] t = new boolean[s.length() + 1];
        Arrays.fill(t, false);
        t[0] = true;
        int len = s.length();

        for (int i = 0; i < len; i++) {

            if (!t[i]) {
                continue;
            }

            for (String word : wordDict) {
                int end = i + word.length();

                if (end > len) {
                    continue;
                }

                if (t[end]) {
                    continue;
                }

                if (s.substring(i, end).equals(word)) {
                    t[end] = true;
                }

            }
        }

        return t[s.length()];
    }
}