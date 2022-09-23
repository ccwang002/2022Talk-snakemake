## Reproducible data processing by Snakemake


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
    - https://rnabio.org/resources/
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

- Comparison to other workflow management tools (CWL/WDL, Nextflow)
    - CWL/WDL and Nextflow have unique run ids (useful for large scale processing, easier integration with LIMS)
    - Cloud friendly
    - DAG is explicit
    - Not a great investment unless the workflow is run for 100+ times
    - Obviously not great for organizing the analysis
    - More suitable for a core lab
    - CWL separates the definition and execution of the workflow

    - https://cacm.acm.org/magazines/2022/6/261172-methods-included/fulltext

- vs Airflow
    - Not HPC friendly
    - File management
    - Requires an infrastructure to mantain the Airflow engine
    - https://mamarcus64.medium.com/comparing-nextflow-and-airflow-for-scientific-workflows-b54768c0bdf6
    - Mention https://academic.oup.com/gigascience/article/8/7/giz084/5535758
    - See also https://twitter.com/bernhardsson/status/1509220914604482566

- Summary of Snakemake
    - Great for prototyping and small to mid scale of pipeline
