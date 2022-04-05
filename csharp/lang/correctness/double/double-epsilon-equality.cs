using System;

public class Example
{
   static bool IsApproximatelyEqual(double value1, double value2, double epsilon)
   {
      // If they are equal anyway, just return True.
      if (value1.Equals(value2))
         return true;

      // Handle NaN, Infinity.
      if (Double.IsInfinity(value1) | Double.IsNaN(value1))
         return value1.Equals(value2);
      else if (Double.IsInfinity(value2) | Double.IsNaN(value2))
         return value1.Equals(value2);

      // Handle zero to avoid division by zero
      double divisor = Math.Max(value1, value2);
      if (divisor.Equals(0))
         divisor = Math.Min(value1, value2);
      //ruleid: correctness-double-epsilon-equality
      return Math.Abs((value1 - value2) / divisor) <= Double.Epsilon;
   }

   static bool lazyEqualLeftCompare(double v1, double v2){
       //ruleid: correctness-double-epsilon-equality
       return Math.Abs(v1 - v2) <= Double.Epsilon;
   }

   static bool lazyEqualRightCompare(double v1, double v2){
       //ruleid: correctness-double-epsilon-equality
       return  Double.Epsilon <= Math.Abs(v1 - v2);
   }

   static bool uselessZeroEqual(){
       double v1 = 0;
       double v2 = 0;
       //ok
       return Math.Abs(v1 - v2) <= Double.Epsilon;
   }

   static bool isZero(double arg){
       double zero = 0;
       //ok
       return Math.Abs(arg - zero) <= Double.Epsilon;
   }

   static bool isZero2(double arg){
       double zero = 0;
       //ok
       return Math.Abs(zero - arg) <= Double.Epsilon;
   }

   static bool isZero3(double arg){
       double zero;
       zero = 0;
       //ok
       return Math.Abs(zero - arg) <= Double.Epsilon;
   }

   static bool isZero4(double arg){
       double zero;
       zero = 0;
       //ok
       return Math.Abs(arg - zero) <= Double.Epsilon;
   }
}
