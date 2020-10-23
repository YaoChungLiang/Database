# Quiz 1
Q1 SQL Queries
37 Points
Multiple questions on this quiz will refer to the track meet schema.   Refer to the following information when you encounter these questions: 

This is the schema of a relational database for keeping records of track meets (athletic contests for runners). A meet can have multiple events, say a 100 meter run and a 200 meter run. A contestant can be in multiple meets and multiple events at the same meet. A contestant is on a single team. The performance table keeps track of the time a specific contestant took to complete a specific event at a specific meet and whether they won that event. Multiple people can win the same event if they tie.  
  
Meet(id, name, year)   
Event(id, mid, name)   
Team(id, name, organization)  
Contestant(id, tid, name, birthyear)   
Performance(eid, cid, time, won) // Time in seconds. Won is 0 if lost, 1 if won.  
  
Meet.id, Event.id, Team.id, Contestant.id are primary keys in their respective tables.  
Performance (eid, cid) is the primary key of the Performance table.   Performance links Events to Contestants on their primary keys.  
Event.mid is a foreign key to the Meet table.  
Contestant.tid is a foreign key to the Team table.  
Assume all ids are integers and time, year attributes, and won are integers. All other values are of type VARCHAR(N) with the appropriate length.  

Assume that there are no NULL values in the data.  