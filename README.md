# betsoftwareonlineshopapi

API
-Publish the API
-Deploy the api on IIS on the web server
-Ensure .Net core bundles are  installed on the webserver

Database is attached to this repo.
-Restore the database on SQL Server 2016 or higher. Alternative run the script included in the repo to create the database.

Update the database connectionstring inside the appsettings.json.

Web App
-Deploy the App on IIS
-Change Application pool .Net CRL version to No Managed Code and Managed pipeline mode to Integrated.
-Edit app.module.ts file. Update the value APIUrl property to api host name.