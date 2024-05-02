# Sudoku_Hierarchical_Classifier
**Computes the universal T&amp;E-classification of Sudoku puzzles and their B, BxB or BxBB sub-classifications**<br><br>

### The author of the Sudoku Hierarchical Classifier (SHC) is François Cordoliani.
#### This software is proposed here on his behalf.<br><br>

The development of the SHC was based on the same references as CSP-Rules or SudoRules (recalled at the end) but the implementations were totally independent.<br>
All the classification results of the SHC and of SudoRules completely coincide on the large collections of puzzles used to compare them.<br>
The SHC is much faster than SudoRules for the functionalities it implements. <br>
It is hoped that the T&E-depth and BxB parts will be very useful in the search for the "hardest" puzzles.<br><br>
For full details about the concepts and theories underlying the SHC, see [CRT] or [PBCS].<br>
For a much shorter (almost) self-contained introduction to them and for the analysis of some of the SHC results, see [HCCS].<br><br>

WARNING: Due to possible confusions with the BpB rating, what was previously called the BpB classification is now called the BxB classification. Similarly, what was previously called the BpBB classification is now called the BxBB classification. Corresponding name changes have therefore been made in the command line. Nothing else has changed.<br><br>


### The SHC file structure

examples/B-input.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/B-output.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/B-output-expected.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/B-messages.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/BxB-input.tx<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/BxB-output.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/BxB-output-expected.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/BxB-messages.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/BxBB-input.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/BxBB-output.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/BxBB-output-expected.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/BxBB-messages.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/TE-input.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/TE-output.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/TE-output-expected.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/TE-messages.txt<br>
input.txt<br>
LICENSE<br>
output.txt<br>
README.txt<br>
SHC.jar<br>
Expand.jar<br><br>


### Running the SHC

As SHC is a Java program, you must first make sure you have Java installed on your machine.<br>
The executable version of the SHC is a typical .jar file, SHC.jar, in the SHC root directory. As such, it is launched in that directory, in a standard way, by the following command line:<br>

**java -jar SHC.jar \<classif\> (-examples) (-input \<input-file\>) (-output \<output-file\>) (-erase \<erase\>) (-auto-end \<auto-end\>) (-max-length \<max-length\>) (-max-time \<max-time\>) (-buffer-size \<buffer-size\>) (-puzzle \<puzzle>\)**<br><br>
where:<br>
**▸**	parts within parentheses are optional;<br>
**▸**	a - sign at the start of a keyword recalls that the choice is possible but not mandatory;<br>
**▸**	\<classif\> := version | TE-depth | B | BxB | BxBB; this is a mandatory choice, where you decide which of the four available classifications you want to apply to your puzzles; (version is considered as the "empty classification"; it only outputs the SHC version number); <br>

**▸**	the presence of keyword -examples allows to specify that you want to run the predefined examples for the classification previously chosen; in this case, adapted specific values are chosen for the options and no other option should be present, exxcept possibly -auto-end; if other options are nevertheless present, a message will be issued and they will be ignored;<br>

**▸**	\<input-file\> and \<output-file\> are paths to files; they allow to specify which input and output files will be used (\<input-file\> for the puzzles and \<output-file\> for the classification results);<br>
the default values for \<input-file\> and \<output-file\> are respectively the “input.txt” and “output.txt” files of the SHC root folder, except in case -examples was selected, where they are  predefined in a different way (the corresponding xxx-input and xxx-output files of the "examples" folder, where xxx = \<classif\> );<br>

**▸**	\<erase\> := true | false;<br>
by default, \<erase\> = true and the output file is emptied before writing new results to it;<br>
you may change this behaviour by specifying "-erase false"; this will allow you to recover your previous calculations in case you forgot to copy them to another file; each time the SHC is launched with this option set to false, a title line recalling which computations follow will be added before the results;<br>
however, if -examples is selected, \<erase\> is automatically set to true and can't be changed; the reason is to allow easy comparisons with the expected results.<br>

**▸**	\<auto-end\> := true | false;<br>
by default, \<auto-end\> is true and the process fully terminates at the end of the computations; set \<auto-end\> to false if you want to recover the previous behaviour (preventing the Windows console to close at the end of the computations, so that you have time to check the messages in the console); this option can be completely ignored by non-Windows users; having \<auto-end\> true by default will allow to more easily include SHC in scripts (in particular in the search for hard puzzles).<br>


The following three options should be present only in case \<classif\> = B or BxB; if any of them is present in an other case, a warning will be issued and it will be merely ignored:<br>
**▸**	\<max-length\> is an integer, the maximal length allowed for braids, with default value 8 in case \<classif\> = B and 14 in case \<classif\> = BxB; the purpose is to avoid too long calculations of the B rating for very hard puzzles in T&E(1), but to leave a wide margin of possibilities for the BxB classification, allowing to find extreme T&E(2) puzzles up to the highest known ones (i.e. up to B14B); note that pre-checking that the puzzle(s) is (are) in T&E(1) or T&E(2) is under the user’s responsibility;<br>
**▸**	\<max-time\> is an integer, the maximum time (with default value 10), in minutes, allowed for the computation of each puzzle in the input file or for \<puzzle\>; it applies only to the case \<classif\> = B;<br>
**▸**	\<buffer-size\> is an integer defining the maximum number of partial braids the program can store; default value is 500,000 if \<classif\>= B or BxB; change it only if it is too small; <br>

**▸**	\<puzzle\> is all that remains in the command line after all the options (but only the first 81 caracters after -puzzle are effectively considered); \<puzzle\> is the standard line representation of a sudoku puzzle; when \<puzzle\> is present, it will be ignored if -examples is specified, as stated previously; no -input or -output may be specified; if they are present, they will be ignored; for  technical reasons, \<puzzle\> may not contain any space or semi-colon; it may contain e.g. underscores instead.<br><br>


### Output of the SHC

For any puzzle, the result of each of the four classifications is an integer, normally positive or null.<br>
However, it may take negative values in the following cases (with corresponding remediations):<br>
-1  &nbsp;&nbsp;&nbsp;this puzzle is not in the right format, or it has no solution, or it has several solutions; check your puzzle;<br>
-2  &nbsp;&nbsp;&nbsp;\<max-time\> allowed is too short for this puzzle; try increasing it;<br>
-3  &nbsp;&nbsp;&nbsp;\<buffer-size\> is too small for this puzzle; try increasing it;<br>
-4  &nbsp;&nbsp;&nbsp;other problems encountered, such as: <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\<classif\> is not  relevant for this puzzle (e.g. applying the BxB classification to a puzzle in T&E(3)); check the T&E-depth of this puzzle;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\<max-length\> is too small for this puzzle (in case \<classif\> = B); try increasing it; note that if you increase \<max-length\>, you may also have to increase \<max-time\> and/or \<buffer-size\>.<br><br>

Notice that, in the \<classif\> = B case, what is computed is actually a **_truncated B rating_**, with all the values above \<max-length\> leading to output -4. <br>
This is justified for two reasons:<br>
▸	in order to keep computation times and memory requirements within reasonable bounds when default values are used;<br>
▸	because, in unbiased statistics, puzzles with B rating greater than 8 are rare.<br><br>
In the SHC view, the main purpose of the B rating is to provide a rough sub-classification of T&E(1). Puzzles in T&E(1) that are beyond the chosen upper bound for chains length are considered as "exceptional".<br><br>



### Examples

The examples folder contains four collections of puzzles, each adapted to one of the four classifications computed by the SHC.<br>
Each collection is a small part of the large collection of puzzles used by Denis Berthier to compare the SudoRules and SHC results (which also provides a cross validation for both, as they were indepedently implemented in totally different ways).<br>
They are used to illustrate the results one can obtain with the SHC and to give an idea of the computation times one may expect.<br>
For details about the selection of examples, see [HCCS].<br><br>



### Expand.jar
A new functionality has been added to the SHC, considering the needs of the search for the hardest puzzles: expansion by Singles. Expand is launched in the SHC root directory and its nyntax is as follows:<br>
**java -jar Expand.jar (-input \<input-file\>) (-output \<output-file\>) (-erase \<erase\>) (-auto-end \<auto-end\>) (-puzzle \<puzzle>\)**<br>
with all the options working the same way as in SHC.jar.<br><br>




### References

[CRT]: BERTHIER D., Constraint Resolution Theories, Lulu.com Publishers, November 2011.<br>
[HCCS]: BERTHIER D., Hierarchical Classifications in Constraint Satisfaction, Lulu Press, October 2023.<br>
[PBCS1]: BERTHIER D., Pattern-Based Constraint Satisfaction and Logic Puzzles (First Edition), Lulu Press, November 2012.<br>
[PBCS2]: BERTHIER D., Pattern-Based Constraint Satisfaction and Logic Puzzles (Second Edition), Lulu Press, July 2015.<br>
[PBCS3]: BERTHIER D., Pattern-Based Constraint Satisfaction and Logic Puzzles (Third Edition), Lulu Press, Novembre 2021.<br>
[PBCS]: any of [PBCS1], [PBCS2] or [PBCS3].<br>
