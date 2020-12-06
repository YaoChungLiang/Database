CREATE EXTERNAL DATA SOURCE cse414blob
WITH (  TYPE = BLOB_STORAGE,
        LOCATION = 'https://cse414blob.blob.core.windows.net/cse414blob'
);