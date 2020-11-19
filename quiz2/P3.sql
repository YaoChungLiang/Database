Student Employee(name,
                 **id**)

HFS Employee(role, 
            **id** REFERENCES Employee(id))

Class(**id**,
      name,
      department)

Enrolled In(FOREIGN KEY(Cid) REFERENCES Class(id), 
            FOREIGN KEY(SEid) REFERENCES Student Employee(id))

TA(**SEid** REFERENCES Employee(id), 
   **Cid** UNIQUE REFERENCES Class(id))


