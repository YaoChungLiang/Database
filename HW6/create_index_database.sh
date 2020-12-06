curl -v --data-urlencode "statement=`cat q10.sqlp`" --data pretty=true http://localhost:19002/query/service > output.txt

# this query help create index-table using the configuration in q10.sqlp
# you need to execute this script to create indexed-database first in order to run q11 and q12.