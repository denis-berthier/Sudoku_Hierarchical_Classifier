# Sudoku_Hierarchical_Classifier
Outputs the universal T&amp;E-classification of Sudoku puzzles and their B, BpB or BpBB sub-classifications<br>

### Author: François Cordoliani.
The development of the SHC was based on the same references as SudoRules (recalled at the end) but the implementations were independent.<br>
All the classification results of the SHC and of SudoRules completely coincide on the large collections of puzzles used to compare them.<br>
The SHC is much faster for the functionalities it implements.

### Running the SHC

As SHC is a Java program, you must first make sure you have Java installed on your machine.<br>
The SHC is delivered as a typical .jar file in the SHC root directory. As such, it is launched in that directory, in a standard way, by the following command line:<br>

**java -jar SHC.jar \<classif\> (-examples) (-input \<input-file\>) (-output \<output-file\>) (-max-length \<chain-max-length\>) (-max-time \<max-time\>) (-buffer-size \<buffer-size\> (\<puzzle>\)**<br>
where:<br>
–	parts within parentheses are optional;<br>
–	a - sign at the start of a keyword recalls that the choice is possible but not mandatory;<br>
–	\<classif\> := TE-depth | B | BpB | BpBB; this is a mandatory choice, where you decide which classification you want to apply to your puzzles;<br>
–	the presence of keyword -examples allows to specify that you want to run the predefined examples for the classification previously chosen; in this case, no other option is allowed;<br>
–	\<input-file\> and \<output-file\> are full paths to files; they allow to specify which input and output files will be used (<input-file> for the puzzles and <output-file> for the classification results); the default values for \<input-file\> and \<output-file\> are respectively the “input.txt” and “output.txt” files of the SHC root folder, except in case -examples was selected, where they are  predefined in a different way (the corresponding xxx-input and xxx-output files of the "examples" folder, where xxx = \<classif\> );<br>
–	\<chain-max-length\> is an integer, the maximal length allowed for chains (i.e. for braids); this option is allowed only when \<classif\>=B, in which case the default value is 9; the purpose is to avoid too long calculations of the B rating for very hard puzzles; note that pre-checking that the puzzle(s) is (are) in T&E(1) is under the user’s responsibility;<br>
–	\<max-time\> is the maximum time, in minutes, allowed for the computation of each puzzle in the input file (with default value unrestricted);
–	\<buffer-size\> is an integer defining the maximum number of internal chains the program can store; default value is 50,000; change it only if its is too small (which can happen only in the \<classif\> = B case);<br>
–	\<puzzle\> is all that remains in the command line after all the options (but only the first 81 caracters after the space following the last option are effectively considered); \<puzzle\> is the standard line representation of a sudoku puzzle; if \<puzzle\> is present, -example may not be selected and no -input or -output may be specified.<br>


### References

[CRT]: BERTHIER D., Constraint Resolution Theories, Lulu.com Publishers, November 2011.<br>
[PBCS1]: BERTHIER D., Pattern-Based Constraint Satisfaction and Logic Puzzles (First Edition), Lulu Press, November 2012.<br>
[PBCS2]: BERTHIER D., Pattern-Based Constraint Satisfaction and Logic Puzzles (Second Edition), Lulu Press, July 2015.<br>
[PBCS3]: BERTHIER D., Pattern-Based Constraint Satisfaction and Logic Puzzles (Third Edition), Lulu Press, Novembre 2021.<br>
[SHC]: BERTHIER D., The Sudoku Hierarchical Classifier, Lulu Press, October 2023.<br>
[UMRN]: BERTHIER D., User Manual and Research Notebooks for CSP-Rules, Lulu Press, Juillet 2023.<br>
