curl -v --data-urlencode "statement=`cat sample.sqlp`" --data pretty=true http://localhost:19002/query/service > output.txt