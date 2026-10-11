# GA3 answers - Lillian Ehresmann

------------------------------------------------------------------------

## Part A: Your README, data, and Git repo

### 1: Create subdirs and copy files

### 2: Initialize a Git repository, and commit the README and `.gitignore`

### 3: Commit throughout the assignment

------------------------------------------------------------------------

## Part B: Basic shell scripts

### 4: Predict the output of `echo.sh`

*Answer* (prediction and reasoning for `bash scripts/echo.sh Oct07 Oct08`): I predict the output will be Oct07 Oct08 but stops at $3 (unbound variable) because there are only two arguments given.

*Answer* (prediction and reasoning for `bash scripts/echo.sh Oct07 Oct08 Oct09 Oct10`): I predict the output will be Oct07 Oct08 Oct09. Because a fourth argument is given but not specified in the script ($n), it does not print Oct10.

*Answer* (prediction and reasoning for `bash scripts/echo.sh Oct07 Oct08 "Oct09 Oct10"`): I predict the output will be Oct07 Oct08 Oct09 Oct10 because using the quotation marks means it is passed as a single argument.

*Answer* (prediction and reasoning for `bash scripts/echo.sh results/fastqc/*.html`): I predict the output will be listing files from the results/fastqc that end with .html (wildcard). 

### 5: Run `echo.sh` and compare with your predictions

```bash
bash scripts/echo.sh Oct07 Oct08
```

The output of the command was:

```  
Oct07
Oct08
scripts/echo.sh: line 6: $3: unbound variable       
```

```bash
bash scripts/echo.sh Oct07 Oct08 Oct09 Oct10
```

The output of the command was:

```  
Oct07
Oct08
Oct09
Finished      
```

```bash
bash scripts/echo.sh Oct07 Oct08 "Oct09 Oct10"
```

The output of the command was:

```   
Oct07
Oct08
Oct09 Oct10
Finished      
```

```bash
bash scripts/echo.sh results/fastqc/*.html
```

The output of the command was:

```    
results/fastqc/S63_R1_fastqc.html
results/fastqc/S63_R2_fastqc.html
results/fastqc/S64_R1_fastqc.html
Finished    
```

*Answer*: Which output (if any) differed from your prediction, and why? 

I forgot that there was also an "echo Finished" so my prediction didn't include printing that at the end. Also, for the last one, I didn't realize that it would only print 3 of the dozens of fastqc .html files because only three arguments can be accepted in the script.

### 6: Write the `printline.sh` script

### 7: Test `printline.sh` twice

Test 1:

```bash
# Your command: 
bash scripts/printline.sh data/metadata.tsv 2
```

The output of the command was:

```
S82     10dpi   cathemerium         
```

Test 2 (with redirection), and checking the contents of the output file:

```bash
# Your command:

# Redirect script's output to appropriately named file in results
bash scripts/printline.sh data/metadata.tsv 14 > results/printlinetest.txt 

# Check contents of printlines.sh results file
cat results/printlinetest.txt
```

The output of the command that checks the file contents was:

```  
S64     24hpi   cathemerium    
```

------------------------------------------------------------------------

## Part C: A script to run MultiQC

### 8: Get a MultiQC container link

*Answer*: The container link (URI) is: oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20

### 9: MultiQC's help info, and the MultiQC command

Code to run `multiqc --help` with the container:

```bash
# Your command:
apptainer exec oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20 \ 
  multiqc --help
```

The MultiQC command to run MultiQC on `results/fastqc` with output in `results/multiqc`:

```bash
# Your command:
apptainer exec oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20 \
  multiqc -o results/multiqc results/fastqc/
```

### 10: Write the `multiqc.sh` script

### 11: Run `multiqc.sh`

Code to run the script:

```bash
# Your command:
bash scripts/multiqc.sh
```

*Answer*: Number of FastQC reports MultiQC found: 44

*Answer*: Does that match what you expected? Why/why not? Yes, that is the number of samples we have.

### 12: Make `multiqc.sh` accept arguments, and rerun it

Code to rerun the script:

```bash
# Your command:
bash scripts/multiqc.sh results/multiqc/ results/fastqc/
```

### 13: Differences between the two MultiQC runs

*Answer*: I noticed that the initial output was the same (path to input, searching progress bar, number of reports found etc.) but after that it noted that the results would be written with a suffix (_1) because we have already performed the command once before. That is, it does not automatically overwrite the output unless you specify it to (have to use --force option to overwrite the original files). 

------------------------------------------------------------------------

## Part D: Pandoc to render Markdown

### 14: The structure of the Pandoc command

*Answer* (options and arguments, and what each does): The option -o is the output file. After that, the command specifies the input markdown file to use to render. 

*Answer* (how does Pandoc know which output format to produce?): Because of the extension .pdf.

### 15: Render your README to PDF and HTML

```bash
pandoc -o README.pdf README.md
```

- Command to render to HTML:

```bash
# Your command:
pandoc -o README.html README.md
```

### 16: Should the rendered files be committed?

*Answer*: Should the rendered files be committed to your Git repo? Why/why not? No, because these are files derived from a manually editable file. You should commit the README.md not any potential files that can be produced from it. One reason is because .pdf or .html (derived files) can be re-generated at any time using the original README.md and saving too many derived files can lead to unnecessary accumulation of files in the repository. 

### 17: Install the PDF Viewer extension and view the PDF

*Answer*: One observation about the rendered PDF file: It seems important to not exceed a certain line length if you want the pdf-rendered information to be accurate. Specifically, the long link to the MultiQC container meant the subsequent line of code was cut off on my first rendering of the pdf rendering because I did not break the line (\) in the code. The pdf is apparently restricted to normal printing page width. 

## Part E: Publish your repo on GitHub

### 18: Create a GitHub repository

### 19: Connect your local repo to GitHub, and push

### 20: Create an Issue to tag the instructors

------------------------------------------------------------------------

## Bonus

### 21: Explore the MultiQC report

*Answer* (one insight you gained):

*Answer* (one thing you're confused about):

### 22: Pandoc versions

```bash
# Your command:
```

The output of the command(s) was:

```         
```

*Answer*: Is the Pandoc version available by default the most recent one?

*Answer*: Which Pandoc version are you using after loading the module?