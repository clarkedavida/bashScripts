# bashTools
This is a collection of Bash scripts that I use to manipulate files, 
submit jobs, and automate measurements for lattice QCD. These include:

- `bashHacks.md`: A note to help remember how to accomplish various tasks in the terminal.
- `bashTools.bash`: Some colors and error handing Bash functions.
- `betaLists`: A collection of $N_f=2+1$ and $N_f=3$ parameter combinations for HotQCD.
- `general`: A collection of general scripts, callable from the terminal.
- `HotQCDTools.bash`: Some tools for managing parameter names using the conventions and lines of physics of the HotQCD collaboration.
- `installBashTools.bash`: A simple script to set up these `bashTools`.
- `MILC`: Some scripts to assist with building MILC code.
- `profilingExamples`: Some examples how to use profilers. These could be made more general later.
- `SIMULATeQCD`: Some scripts to assist with building SIMULATeQCD. 
- `slurm`: A collection of scripts to help manage clusters using slurm.
- `tests`: Some tests to make sure the installation worked. 

To get the bashTools ready, simply
```Shell
bash installBashTools.bash
```
This adds a global variable `bashToolsPath` to your `.bashrc`, along
with a few aliases for convenience scripts.  You may need to
restart your terminal for the bashScripts to work. Try navigating to the `tests`
folder and running `runTests.bash` to see if everything worked.
