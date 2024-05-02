The time utility executes and times the specified utility.  After the utility finishes, time writes to the standard error stream, (in seconds): the total time elapsed, the time used to execute the utility process and the time consumed by system overhead.

The message shall include the following information:
The elapsed (real) time between invocation of utility and its termination.
The User CPU time, equivalent to the sum of the tms_utime and tms_cutime fields returned by the times() function defined in the System Interfaces volume of POSIX.1-2017 for the process in which utility is executed.
The System CPU time, equivalent to the sum of the tms_stime and tms_cstime fields returned by the times() function for the process in which utility is executed.


The total CPU time is the combination of the amount of time the CPU or CPUs spent performing some action for a program and the amount of time they spent performing system calls for the kernel on the program''s behalf. When a program loops through an array, it is accumulating user CPU time. Conversely, when a program executes a system call such as exec or fork, it is accumulating system CPU time.
The term "real time" in this context refers to elapsed wall-clock time, like using a stop watch. The total CPU time (user time + sys time) may be more or less than that value. Because a program may spend some time waiting and not executing at all (whether in user mode or system mode) the real time may be greater than the total CPU time. Because a program may fork children whose CPU times (both user and sys) are added to the values reported by the time command, but on a multicore system these tasks are run in parallel, the total CPU time may be greater than the real time.






for each set of 100 puzzles in BpB-input.txt

time java -jar FPGX.jar --input=/Users/berthier/Documents/Projets/CSP-Rules/SHC/SHC5/examples/B2B-input.txt --output=/Users/berthier/Documents/Projets/CSP-Rules/SHC/SHC5/examples/FPGX-p2.txt
java -jar FPGX.jar    2510,52s user 27,02s system 720% cpu 5:52,01 total

time java -jar FPGX.jar --input=/Users/berthier/Documents/Projets/CSP-Rules/SHC/SHC5/examples/B3B-input.txt --output=/Users/berthier/Documents/Projets/CSP-Rules/SHC/SHC5/examples/FPGX-p3.txt
java -jar FPGX.jar    4916,57s user 45,25s system 635% cpu 13:01,11 total

time java -jar FPGX.jar --input=/Users/berthier/Documents/Projets/CSP-Rules/SHC/SHC5/examples/B4B-input.txt --output=/Users/berthier/Documents/Projets/CSP-Rules/SHC/SHC5/examples/FPGX-p4.txt
java -jar FPGX.jar    7258,58s user 55,93s system 449% cpu 27:07,30 total

time java -jar FPGX.jar --input=/Users/berthier/Documents/Projets/CSP-Rules/SHC/SHC5/examples/B5B-input.txt --output=/Users/berthier/Documents/Projets/CSP-Rules/SHC/SHC5/examples/FPGX-p5.txt
java -jar FPGX.jar    11368,39s user 78,88s system 363% cpu 52:28,17 total

time java -jar FPGX.jar --input=/Users/berthier/Documents/Projets/CSP-Rules/SHC/SHC5/examples/B6B-input.txt --output=/Users/berthier/Documents/Projets/CSP-Rules/SHC/SHC5/examples/FPGX-p6.txt
java -jar FPGX.jar    8914,89s user 64,92s system 390% cpu 38:19,38 total

time java -jar FPGX.jar --input=/Users/berthier/Documents/Projets/CSP-Rules/SHC/SHC5/examples/B7B-input.txt --output=/Users/berthier/Documents/Projets/CSP-Rules/SHC/SHC5/examples/FPGX-p7.txt
java -jar FPGX.jar    3195,91s user 30,08s system 441% cpu 12:10,53 total


(loop-for-count (?i 5 5)
    (printout t ?i " : ")
    (file-min-value (str-cat
        "/Users/berthier/Documents/Projets/CSP-Rules/SHC/SHC5/examples/FPGX-p"
        ?i
        ".txt"
    ))
    (file-max-value (str-cat
        "/Users/berthier/Documents/Projets/CSP-Rules/SHC/SHC5/examples/FPGX-p"
        ?i
        ".txt"
    ))
    (file-mean-and-sd (str-cat
        "/Users/berthier/Documents/Projets/CSP-Rules/SHC/SHC5/examples/FPGX-p"
        ?i
        ".txt"
    ))
)
