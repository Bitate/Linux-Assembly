/*******************************************************
 * An example to illustrate call-by-value and          *
 * call-by-reference parameter passing between C and   *
 * assembly language modules. The min_max function is  *
 * written in assembly language (in hll_minmaxa.asm).  *
 *******************************************************/
#include <stdio.h>
int main(void)
{
      int     value1, value2, value3;
      int     min, max;
      extern  void min_max (int, int, int, int*, int*);

      printf("Enter number 1 = ");
      scanf("%d", &value1);
      printf("Enter number 2 = ");
      scanf("%d", &value2);
      printf("Enter number 3 = ");
      scanf("%d", &value3);

      min_max(value1, value2, value3, &min, &max);
      printf("Minimum = %d, Maximum = %d\n", min, max);
      return 0;
}
