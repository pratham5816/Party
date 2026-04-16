import java.util.*;
public class Generics{
    public static void main(String[] args){
        ArrayList<Integer> arr = new ArrayList<Integer>();
        arr.add(1);
        arr.add(2);
        arr.add("hello");
        arr.add(3);

        int total = 0;
        for(Integer i : arr){
            System.out.println(i);
            total+=i;
        }

        try{
            for(Integer i : arr){
                System.out.println(i.intValue());
            }
        }catch(Exception e){
                System.out.println(e);
        }
    }
}