## AsterixDB and SQL++ tasks
This repo is for learning how to query dictionary-like databse system using AsterixDB and SQL++.

## Requirements
1. [JDK8](https://www.oracle.com/bh/java/technologies/javase/javase-jdk8-downloads.html)
2. [AsterixDB](https://www.apache.org/dyn/closer.lua/asterixdb/asterixdb-0.9.4.1/asterix-server-0.9.4.1-binary-assembly.zip)

## Steps
After downloading all the reqirements.  
0. Set up ```JAVA_HOME``` environmental variable points to the extracted folder ```{pathToYourJdk}/bin```.
1. Extract the AsterixDB file and execute the script ```start-sample-cluster.sh``` or  ```start-sample-cluster.bat``` in ```{pathToYourAsterixDB}/opt/local/bin```to start an instance of AsterixDB.
2. Download [data](https://drive.google.com/file/d/1rNSUFs1wM1ppdGnRDvTDEuyA9gUwVGwV/view).
3. Run ```./run.sh``` to activate AsterixDB server. 
4. Run ```./create_database.sh``` to create database from your data. Remember to change the path inside this script.
5. Rnm ```./create_index_database.sh``` to create database and tables with index, which would help query faster.  
5. Run ```./sample.sh``` to check if the dataverse is created and working.
6. Run ```./stop.sh``` to terminate the AsterixDB server process.

## Run on local machine
You can run ```./sample.sh ${input_filename} ${output_filename}```. to see the result in ```${cur_folder}/output/```.

## Tips
1. After the start of an AsterixDB instance, you can enter the query interface by visiting (127.0.0.1:19001)[http://127.0.0.1:19001].

## MEMO
q11.sqlp is the same as q9.sqlp but with index in it, so it's 13xx times faster than previous query.