# Advanced Information Systems

In this project a fully functional information system was developed utilizing the open data  provided by the [data.gov.uk](https://data.gov.uk/dataset/road-accidents-safety-data) website. This data consists of various road accidents entries with vehicles and casualties references as well as alcohol tests' measurements. 

## Data warehouse

The ETL process is performed using integration services project in Visual Studio's Data Tools. Utilizing flow tasks and SQL tasks the available `.csv` files are imported in the data warehouse' s database. Data cleaning, integration, transformation, reduction techniques are applied on the SQL Server using stored procedures functionality, which populate the dimensions and fact table with the appropriate values as defined  [here](https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/230590/stats19.pdf). Finally an analysis service project is used for the creation of the OLAP - cube. Two separate cubes were created, one containing accident' s data, and another with alcohol breath tests.

## Visualizations

PowerBi reports can be found below :
* [Casualties](https://app.powerbi.com/view?r=eyJrIjoiZjIzNzY3MDYtNjZiNy00NmVlLTgzYzAtN2RjOWZiN2JhZTA4IiwidCI6IjFiNDRmYTU4LTdmZDEtNDk4NS04MmVmLTIyYzQ3NGZlYTEwOSIsImMiOjh9)
* [Digital breath tests](https://app.powerbi.com/view?r=eyJrIjoiMjc5M2MyMTQtYjAwYi00MGQ3LTk1NjgtZTI3MjU5ZDQwYmYxIiwidCI6IjFiNDRmYTU4LTdmZDEtNDk4NS04MmVmLTIyYzQ3NGZlYTEwOSIsImMiOjh9)

## Project's Structure

The directories above contain the integration and analysis services projects as well as the SQL and dataset samples for each cube respectively.

