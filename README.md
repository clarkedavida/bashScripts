# bashScripts
This is a collection of Bash scripts that I use to manipulate files, 
submit jobs, and automate measurements for lattice QCD. These include:

- `bashTools.bash`: Some colors and error handing Bash functions.
- `betaLists`: A collection of $N_f=2+1$ and $N_f=3$ parameter combinations for HotQCD.
- `comments.bash`: A script for making header comments in a consistent way.
- `concatenateFiles.bash`: A script to combine output files into one file in a human-readable way. 
- `createCompressedSubfolders.bash`: Go into a folder and `tar -zcf` every subfolder, then delete that subfolder.
- `general`: A collection of general scripts, callable from the terminal.
- `HotQCDTools.bash`: Some tools for managing parameter names using the conventions and lines of physics of the HotQCD collaboration.
- `MILC`: Some scripts to assist with building MILC code.
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
