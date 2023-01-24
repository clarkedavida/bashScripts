# Scripts for compiling the MILC code

This folder contains scripts to help compile MILC on various clusters. MILC has a lot
of dependencies, and each cluster has its own architecture, so it is convenient to
collect scripts to keep everything running smoothly. Please have a look into
- `build_quda.bash`
- `build_milc_quda.bash`
to see what kinds of options are available and for which clusters this works. If you have
installed `bashTools`, you should be able to make your MILC executables by simply calling
the commands (from anywhere)
1. `buildQUDA`
2. `buildMILC`
 

## The WANT_MIXED_PRECISION_GPU flag
Carleton: As I understand it, with 1, a double-precision solve uses single-precision for 
the inner loop.  With 2, it uses half-precision for the inner loop.  With 1 or 2, a 
single-precision solve uses half-precision for the inner loop.  I haven’t compared 
performance see which is best for our applications.  But one might expect 2 should do better, 
because it creates less network traffic.
