# Introduction to Data Cleaning with OpenRefine

Sometimes the data we work with isn’t just "messy" (in the sense of Wickham's concept of messy vs _tidy_ data), it’s in fact "_dirty_". While Wickham’s tidy data addresses how data can be structured for analysis, it does not consider fundamental _data quality_ issues. Dirty data, on the other hand, may contain a variety of errors, such as malformatted values, typographical errors, or other inconsistencies. Before we can tidy our data and prepare it for analysis, we need to do the important work of identifying and correcting errors in the data that affect quality and might impact our analysis. 

OpenRefine is an open-source tool for interactively profiling, transforming, and cleaning data. While OpenRefine is interactive, it also supports tracking and exporting actions that can be reapplied to original data (transparent and reproducible data cleaning)

In this lab you will:
* Explore and clean a dirty dataset with OpenRefine
* Identify and resolve data quality issues

Learning objectives:
* Demonstrate an understanding of data cleaning activities
* Gain practical experience cleaning data with OpenRefine


## Scenario
You’ve been tasked with cleaning a dataset in preparation for analysis. The data is based on inspections of Chicago restaurants and contains the following fields. Your job is to explore the dataset, identify and resolve quality issues.  One of several target analysis goals is the question of whether a given ZIP Code has higher risk food safety violations. 

* Potential data quality issues include:
* Typos and misspellings that can be resolved via clustering and merging values
* Unnecessary whitespace
* Variations in case
* Malformed or differently formatted values (dates, numbers, etc)
* Columns that require splitting or merging

## Install OpenRefine

* Download and install OpenRefine from https://openrefine.org/download
* Run OpenRefine (it will open in your browser with URL http://127.0.0.1:3333/)

## Prepare your lab7 folder

* Create a new folder `lab7` in your class repository

## Download and Import 

Download and import the [food-inspection-dirty.csv](https://github.com/illinois-data-curation/is477-fa24/blob/main/labs/food-inspections-dirty.csv) into OpenRefine. To download the file, click on the link and download from GitHub.

The dataset has a number of known errors. Identify and resolve quality issues applying each of the following (and possibly additional) operations, as needed:
  * Normalizing malformed or differently formatted values
  * Trimming and/or collapsing whitespace
  * Case transformations
  * Splitting a column
  * Clustering and merging variant spellings to canonical values

## Fitness for Use/Purpose

1. Question that this dataset can be used for
2. Find a use case where cleaning makes a difference
3. Question that this dataset cannot be used for

## Profiling

* Create text facets for the following columns: 
  * Facility type
  * Risk
  * Results
* Sort by count and note the number of rows in each facet
* Note the variations in the "Risk" column

## Cleaning

### Cell Transformations

Select the arrow on the column and select **Edit Cells> Common transforms**.
* Trimming or collapsing whitespace
* Changing case (titlecase, uppercase, lowercase)
* Converting datatypes (to number, date, text)

Activity:
* Inspect the `Risk` text facet and note differences in whitespace and case
* Trim and collapse whitespace on the `Risk` column
* Make the case consistent (e.g., titlecase, uppercase, lowercase)
* Note the number of rows in each facet

### Undo/Redo History

The Undo/Redo history provides not only a way to undo cleaning operations, but to export (and even reapply) operations in sequence.

Inspect the Undo/Redo history. Later in the lab, you will export it as part of your submission.

## Column Transformations

Select the arrow on the column and select **Edit Column** .Common operations include:
* Splitting a column into multiple columns
* Renaming columns

Activity:
* Split `City State Zip` into three separate columns using comma as a delimiter.
* Rename the first column to `City`, second column to `State`, and third column to `Zip`


## Identifying Errors

While applying transformations is easy, identifying errors encountered during transformation is not as obvious.

Convert the `License` column to number (**Edit Cells> Common transformations > To Number**). While OpenRefine doesn't report it, the column contains non-numeric values.
* Create a new facet on `License` (**Facet > Numeric Facet**) and note that some values are indicated as "non-numeric". Uncheck the "Numeric" checkbox to see the values.
* Close the facet
* As an alternative, on the `License` column select **Sort...** and drag the Errors to the top or bottom. In OR, your dataset will now be sorted with non-numeric values at the top.


## Clustering and Merging

Clustering and merging of variant spellings is a powerful tool in OpenRefine.

* Select the `City` column and **Facet > Text Facet**
* In the new facet, select **Sort by: count**
* Note the various mispellings of Chicago
* Select **Cluster** and explore the clustering options via the `Method` and `Keying function` or `Distance function` dropdowns
* Pick the clustering algorithm that you think best groups variant spellings
* Select the **Merge?** checkbox for the clusters that should be merged 
* Select **Merge selected & re-cluster** 


## Export

Export youar cleaned dataset as `food-inspection-clean.csv` and the OpenRefine Undo/Redo history as `food-inspection-history.json` and commit these to your `lab7` folder.


## Submit Your Lab
* Add and commit `food-inspection-clean.csv` and `food-inspection-history.json`
* Push your changes to GitHub
* Create a `lab-7` tag and release
* Create a new tag and release named `lab-7`
* Submit the URL to your lab-7 release to the Lab 7 Canvas discussion





