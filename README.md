# Sparse-Dataset

This repository contains multiple bash scripts for obtaining different types of
sparse matrix datasets retrieved from various sparse suite collections. We have 
grouped the datasets based on different scientific publications where they were 
referred initially.

We do not maintain the sparse datasets, the scripts are used to retrieve the
datasets from well known locations like the University of FLorida Sparse Suite
Collections and SNAP. 

The datasets are retrieved in compressed format and expanded to to its matrix
market format.

## Usage Details

To use the scripts, we can directly run the scripts with the output location, 
where the datasets are expected to be placed as follows:

```bash
./sanity-dataset.sh <output_directory>
```
