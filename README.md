# bashScripts
This is a collection of Bash scripts that I use to manipulate files, 
submit jobs, and automate measurements for lattice QCD. These include:

- `bashTools.bash`: Some colors and error handing Bash functions.
- `betaLists`: A collection of Nf=2+1 parameter combinations for HotQCD.
- `comments.bash`: A script for making header comments in a consistent way.
- `concatenateFiles.bash`: A script to combine output files into one file in a human-readable way. 
- `createCompressedSubfolders.bash`: Go into a folder and `tar -zcf` every subfolder, then delete that subfolder.
- `HotQCDTools.bash`: Some tools for managing parameter names using the conventions and lines of physics of the HotQCD collaboration.
- `slurm`: A collection of scripts to help manage clusters using slurm.

To get the bashTools ready, simply
```Shell
bash installBashTools.bash
```
All this does is add a global variable to your `.bashrc`, so you may need to
restart your terminal for the bashScripts to work.
