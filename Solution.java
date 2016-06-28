package task;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Arrays;
import java.util.Scanner;

/**
 * Created by WOLF_SKiFF_SSS on 09.04.2016.
 */
public class Solution {
    static int N, E, T;
    static int From[] = new int[200];
    static int To[] = new int[200];
    static double Prob[] = new double[200];
    static int Answer;
    static double AnswerProb;
    static double Curr[] = new double[200];
    static double Next[] = new double[200];

    public static void main(String[] args) throws FileNotFoundException {
        Scanner scanner = new Scanner(new FileInputStream("simple_input.txt"));
            N = scanner.nextInt();
            E = scanner.nextInt();
            T = scanner.nextInt();
        for (int i = 0; i < E; i++) {
            From[i]=scanner.nextInt();
            To[i]=scanner.nextInt();
            Prob[i]=scanner.nextDouble();
        }
        Answer = 0;
        AnswerProb = 0.0;
        int step = T/10;
        Curr[1] = 1.0;

        for (int i = 1; i <= step; i++) {
            for (int j = 0; j < E ; j++) {
                int f = From[j];
                int t = To[j];
                double p = Prob[j];
                Next[t] += Curr[f] * p;
                System.out.println(Curr[f] + " " +f + " f  " + t + "t");
            }

            for (int k = 0; k <Next.length; k++) {
                Curr[k] = Next[k];
            }
            for (int j = 0; j < Next.length; j++) {
                Next[j] = 0;
            }
            System.out.println(Arrays.toString(Next));
            //System.out.println(Arrays.toString(Curr));
        }

        for (int k = 1; k <= N; k++) {
            if (Curr[k] > AnswerProb) {
                AnswerProb = Curr[k];
                Answer = k;
            }
        }
        if (step == 0) {
            AnswerProb = 1.0;
            Answer = 1;
        }
        System.out.println(Answer + " " + AnswerProb);

    }
}
