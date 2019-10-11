#### Publication
31.1. Publication
A publication can be defined on any physical replication master. The node where a publication is defined is referred to as publisher. A publication is a set of changes generated from a table or a group of tables, and might also be described as a change set or replication set. Each publication exists in only one database.

Publications are different from schemas and do not affect how the table is accessed. Each table can be added to multiple publications if needed. Publications may currently only contain tables. Objects must be added explicitly, except when a publication is created for ALL TABLES.

Publications can choose to limit the changes they produce to any combination of INSERT, UPDATE, and DELETE, similar to how triggers are fired by particular event types. By default, all operation types are replicated.

A published table must have a “replica identity” configured in order to be able to replicate UPDATE and DELETE operations, so that appropriate rows to update or delete can be identified on the subscriber side. By default, this is the primary key, if there is one. Another unique index (with certain additional requirements) can also be set to be the replica identity. If the table does not have any suitable key, then it can be set to replica identity “full”, which means the entire row becomes the key. This, however, is very inefficient and should only be used as a fallback if no other solution is possible. If a replica identity other than “full” is set on the publisher side, a replica identity comprising the same or fewer columns must also be set on the subscriber side. See REPLICA IDENTITY for details on how to set the replica identity. If a table without a replica identity is added to a publication that replicates UPDATE or DELETE operations then subsequent UPDATE or DELETE operations will cause an error on the publisher. INSERT operations can proceed regardless of any replica identity.


### Alter Table
```
REPLICA IDENTITY {DEFAULT | USING INDEX index_name | FULL | NOTHING}
```

### REPLICA IDENTITY
This form changes the information which is written to the write-ahead log to identify rows which are updated or deleted. This option has no effect except when logical replication is in use. DEFAULT (the default for non-system tables) records the old values of the columns of the primary key, if any. USING INDEX records the old values of the columns covered by the named index, which must be unique, not partial, not deferrable, and include only columns marked NOT NULL. FULL records the old values of all columns in the row. NOTHING records no information about the old row. (This is the default for system tables.) In all cases, no old values are logged unless at least one of the columns that would be logged differs between the old and new versions of the row.

### Check
 REPLICA IDENTITY {DEFAULT | USING INDEX index_name | FULL | NOTHING}
```
ALTER TABLE "transportiq"."Route" REPLICA IDENTITY DEFAULT ;

SELECT CASE "relreplident"
           WHEN 'd' THEN 'default'
           WHEN 'n' THEN 'nothing'
           WHEN 'f' THEN 'full'
           WHEN 'i' THEN 'index'
           END AS replica_identity, t.oid
FROM pg_catalog.pg_class as t
WHERE t.oid = 'transportiq."Route"'::regclass::oid;
```