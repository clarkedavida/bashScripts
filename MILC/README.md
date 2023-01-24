# Notes on MILC compilation

## The WANT_MIXED_PRECISION_GPU flag
Carleton: As I understand it, with 1, a double-precision solve uses single-precision for the inner loop.  With 2, it uses half-precision for the inner loop.  With 1 or 2, a single-precision solve uses half-precision for the inner loop.  I haven’t compared performance see which is best for our applications.  But one might expect 2 should do better, because it creates less network traffic.
