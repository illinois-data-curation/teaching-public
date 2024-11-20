# Introduction to Data Cleaning with OpenRefine

Sometimes the data we work with isn’t just "messy" (in the sense of Wickham's concept of messy vs _tidy_ data), it’s in fact "_dirty_". While [Wickham’s tidy data](https://www.jstatsoft.org/article/view/v059i10) addresses how data can be structured for analysis, it does not consider fundamental [_data quality_](https://en.wikipedia.org/wiki/Data_quality) issues. Dirty data, on the other hand, may contain a variety of errors, such as malformatted values, typographical errors, or other inconsistencies. Before we can tidy our data and prepare it for analysis, we need to do the important work of identifying and correcting errors in the data that affect quality and might impact our analysis. 

[OpenRefine](https://en.wikipedia.org/wiki/OpenRefine) is an open-source tool for interactively profiling, transforming, and cleaning data. While OpenRefine is interactive, it also supports tracking and exporting actions that can be reapplied to original data (_transparent_ and _reproducible_ data cleaning)

In this lab you will:
* Explore and clean a dirty dataset with OpenRefine
* Identify and resolve data quality issues

Learning objectives:
* Demonstrate an understanding of data cleaning activities
* Gain practical experience cleaning data with OpenRefine


## Scenario
You’ve been tasked with cleaning a dataset in preparation for analysis. The data is based on inspections of Chicago restaurants. Your job is to _explore_ the dataset, identify and resolve _quality issues_.  

One of several target analysis goals is the question of _whether a given ZIP Code has higher risk food safety violations_ compared to the mean for Chicago. 

Potential data quality issues include:
* Typos and misspellings that can be resolved via clustering and merging values
* Unnecessary whitespace
* Variations in case
* Malformed or differently formatted values (dates, numbers, etc)
* Columns that require splitting or merging

## 1. Install OpenRefine

* Download and install OpenRefine from https://openrefine.org/download
* Run OpenRefine (it will open in your browser with URL http://127.0.0.1:3333/)

## 2. Prepare a local folder for your data

* Create a new folder `Data_Cleaning_Lab` in a suitable directory.

## 3. Download and Import 

Download and import the [food-inspection-dirty.csv](https://github.com/illinois-data-curation/is477-fa24/blob/main/labs/food-inspections-dirty.csv) into OpenRefine. To download the file, click on the link and download from GitHub.

The dataset has a number of known errors. Identify and resolve quality issues applying each of the following (and possibly additional) operations, as needed:
  * Normalizing malformed or differently formatted values
  * Trimming and/or collapsing whitespace
  * Case transformations
  * Splitting a column
  * Clustering and merging variant spellings to canonical values

## 4. Fitness for Use/Purpose

1. Think of (analysis) questions or a purpose that this dataset could be used for.
2. Find a concrete question/use case where data cleaning is not needed (data is "good enough")
3. Find a concrete question/use case where data cleaning makes a difference: After cleaning, key questions/queries will yield (more) correct results.

## 5. Profiling

* Create _text facets_ for the following columns: 
  * Facility type
  * Risk
  * Results
* Sort by count and note the number of rows in each facet
* Note the variations in the "Risk" column

## 6. Cleaning

### 6.1 Cell Transformations

Select the arrow on the column and select **Edit Cells> Common transforms**.
* Trimming or collapsing whitespace
* Changing case (titlecase, uppercase, lowercase)
* Converting datatypes (to number, date, text)

Activity:
* Inspect the `Risk` text facet and note differences in whitespace and case
* Trim and collapse whitespace on the `Risk` column
* Make the case consistent (e.g., titlecase, uppercase, lowercase)
* Note the number of rows in each facet

### 6.2 Undo/Redo History

The Undo/Redo history provides not only a way to undo cleaning operations, but to export (and even reapply) operations in sequence.

Inspect the Undo/Redo history. Later in the lab, you will export it as part of your submission.

## 7. Column Transformations

Select the arrow on the column and select **Edit Column** .Common operations include:
* Splitting a column into multiple columns
* Renaming columns

Activity:
* Split `City State Zip` into three separate columns using comma as a delimiter.
* Rename the first column to `City`, second column to `State`, and third column to `Zip`


## 8. Identifying Errors

While applying transformations is easy, identifying errors encountered during transformation is not as obvious.

Convert the `License` column to number (**Edit Cells> Common transformations > To Number**). While OpenRefine doesn't report it, the column contains non-numeric values.
* Create a new facet on `License` (**Facet > Numeric Facet**) and note that some values are indicated as "non-numeric". Uncheck the "Numeric" checkbox to see the values.
* Close the facet
* As an alternative, on the `License` column select **Sort...** and drag the Errors to the top or bottom. In OR, your dataset will now be sorted with non-numeric values at the top.


## 9. Clustering and Merging

Clustering and merging of variant spellings is a powerful tool in OpenRefine.

* Select the `City` column and **Facet > Text Facet**
* In the new facet, select **Sort by: count**
* Note the various mispellings of Chicago
* Select **Cluster** and explore the clustering options via the `Method` and `Keying function` or `Distance function` dropdowns
* Pick the clustering algorithm that you think best groups variant spellings
* Select the **Merge?** checkbox for the clusters that should be merged 
* Select **Merge selected & re-cluster** 


## 10. Export

Export youar cleaned dataset as `food-inspection-clean.csv` and the OpenRefine Undo/Redo history as `food-inspection-history.json` and save these to your `Data_Cleaning_Lab`folder.






