package Week1.plus_minus;
import java.io.*;
import java.util.*;

class Result {

    /*
     * Complete the 'plusMinus' function below.
     *
     * The function accepts INTEGER_ARRAY arr as parameter.
     */

    public static void plusMinus(List<Integer> arr) {
        double pos=0,neg=0,zero=0;
        
        for(Integer n:arr){
            if(n==0) zero++;
            if(n>0)pos++;
            if(n<0)neg++;
        }
        
        System.out.println(Math.round(pos/arr.size()*1000000.0)/1000000.0);
        System.out.println(Math.round(neg/arr.size()*1000000.0)/1000000.0);
        System.out.println(Math.round(zero/arr.size()*1000000.0)/1000000.0);

    }

}

public class Solution {
    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));

        int n = Integer.parseInt(bufferedReader.readLine().trim());

        String[] arrTemp = bufferedReader.readLine().replaceAll("\\s+$", "").split(" ");

        List<Integer> arr = new ArrayList<>();

        for (int i = 0; i < n; i++) {
            int arrItem = Integer.parseInt(arrTemp[i]);
            arr.add(arrItem);
        }

        Result.plusMinus(arr);

        bufferedReader.close();
    }
}
