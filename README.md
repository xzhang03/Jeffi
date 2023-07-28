# Jeffi
Calculates the Jeffrey's confidence interval given hits (x) and sample size (n).

SYNTAX:
```Matlab
[ mean, lowerbound, upperbound ] = jeffi( x, n, alpha, deci )
```
x = number of hits. Must be integer.

n = sample size. Must be integer.

alpha = threshold for statistical significance, e.g. 0.05 (default).

deci = decimal places of output (default 3, meaning 0.001).

EXAMPLE:
```Matlab
[m, lb, ub] = jeffi(8, 10, 0.05, 2);

Output:
Mean: 0.8
Lower bound: 0.5
Upper bound: 0.96
```
