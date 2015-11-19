# road-traffic-collisions
Road traffic collision data for Northern Ireland are available as annual datasets for 1998 to 2014 from the UK Data Service https://discover.ukdataservice.ac.uk/

However, because these are on the archive as ['safeguarded', standard access](https://www.ukdataservice.ac.uk/get-data/data-access-policy/safeguarded-data) data we're not able to reproduce the data as, for example, a combination of all of the years with the labels included. You need to go on to the Data Service and download each of the annual sets yourself. To do this you need to register and tell the service the purpose of your project (hopefully, this will not be required when the data is properly opened).

The R scripts in this repo provide an automated process which you can carry out yourself to combine the annual datasets into one (for each of the collisions, casualties and vehicles), and adding the factor labels so that they are ready for analysis in a human and machine-readable format.

## The data
Each annual dataset contains three files:
* Collisions
* Vehicles
* Casualties

The unique variable 'a_ref' links the three datasets together (match the casualties and vehicles with the collision). You will get the full reference documents in the downloads which explain all of the variables.

## Running the process
* First, download each of the *.tab format downloads from the data service. (SPSS files are also available)
* Unzip them into the forked repository. Then, move the annual sets for each of the different datasets in the relevant /data-archive/casualties, collisions or vehicles directories. 
* Then run the scripts (you might need to change the working directory to get the paths right)

This will create three dataframe objects in the environment:
* collisions (107,329 obs of 22 variables)
* casualties (177,586 obs of 13 variables)
* vehicles (199,439 obs of 16 variables)

It will also save each of these as *.csv in the main repo directory.
