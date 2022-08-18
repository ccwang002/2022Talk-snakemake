## Reproducible data processing by Snakemake

### Abstract
Snakemake is a flexible workflow engine to build reproducible and scalable bioinformatics data analyses. Workflows are described in Makefile-like syntax and support custom Python functions. In this talk, I will share my experience as a researcher on how to use Snakemake to put together a data processing pipeline easily and scale up the pipeline to large number of samples on multiple computing platforms (e.g., local server, HPC, and cloud). I will also talk about lessons/best practices I learned while adopting Snakemake to my data processing and analyses.

Snakemake 是一個靈活易用的workflow engine，用來建立一個可再現、可擴展的生物資訊分析流程。它的 workflow近似Makefile 語法，並能在流程中呼叫自訂的 Python 函式。我會分享以我一個研究員的經驗，如何用 Snakemake改寫我研究用的資料處理流程來處理大量的樣本，並且把同個流程跑在不同環境（本地伺服器、HPC、雲端）。我也會分享我在資料處理、資料分析研究時使用 Snakemake所學到的心得與技巧。

### Outline
- Introduce the scenario
    a. Implement a new pipeline and we have to scale it to multiple samples
        - The pipeline needs to run on standalone Linux server, HPC cluster (their own job queue LSF), and potentially cloud
    b. Make a research project reproducible
        - Runs some data preprocessing from different sources, a few analyses, and perhaps the generation of the figures
        - Update the results when the new data come in

- What is snakemake?
- How does snakemake work?
    - Syntax (Makefile)
    - Custom python function
- Features of snakemake I really like and frequently use
    - Flexible
    - Separate the tasks and the execution
    - Solve 90% of my use cases

- Snakemake pipeline examples
    - https://github.com/ding-lab/cptac_rna_expression
    - https://github.com/ding-lab/HTAN_bulkRNA_expression

- Disadvantages of Snakemake
    - Cons: too flexible, not robust
        - Fragile in a unique setup (the snakemake runtime might crash; my setup can be unique enough to trigger weird bugs)
    - Cons: large scale execution (> 100K tasks) is still difficult
    - Cons: cloud has a huge setup and runtime overhead
        - All files (inputs, outputs, and reference files) need to be tracked by the pipeline
        - All tasks must run in an isolated environment
        - Now each task spends time downloading and uploading the files
        - Optimize how the workflow is run (tasks of processing one sample can be done in a same machine) --> Run batches?

- Experience
    - Batches (isolate the snakefile) and config file
    - Use MD5_SUMS to track upstream sources and outputs
    - A big fat Docker/environment
    - Do we really need to run this pipeline multiple times?
        - If it only needs to run for less than 10 times, a good-o-fashion dumb parallel and some bash scripts is all we need
    - Unless there is a team maintaining the cloud infrastructure, running pipelines on the cloud is not trivial and generally more expensive

- Comparison to other workflow management tools (CWL, Nextflow)
