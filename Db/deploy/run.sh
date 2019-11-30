# Root user definition 
rootPass='postgres';
rootUser='postgres';
server='localhost'
database='interview'

PGPASSWORD=$rootPass psql -h $server -U $rootUser -c "
                    SELECT pg_terminate_backend(pg_stat_activity.pid)
                    FROM pg_stat_activity
                    WHERE pg_stat_activity.datname = '$database'
                    AND pid <> pg_backend_pid()
                    ";
PGPASSWORD=$rootPass psql -h $server -U $rootUser -c "DROP DATABASE IF EXISTS $database";
PGPASSWORD=$rootPass psql -h $server -U $rootUser $database -c "DROP OWNED BY xxx CASCADE";
PGPASSWORD=$rootPass psql -h $server -U $rootUser -c "DROP DATABASE IF EXISTS $database";
PGPASSWORD=$rootPass psql -h $server -U $rootUser -c "CREATE DATABASE $database";
PGPASSWORD=$rootPass psql -h $server -U $rootUser -c "ALTER DATABASE $database OWNER TO xxx";
PGPASSWORD=$rootUser psql -h $server -U $rootUser $database -c "DROP ROLE IF EXISTS xxxr";
PGPASSWORD=$rootUser psql -h $server -U $rootUser $database -c "CREATE ROLE xxx WITH ENCRYPTED PASSWORD 'xxx' ";
PGPASSWORD=$rootUser psql -h $server -U $rootUser $database -c "ALTER ROLE xxx WITH LOGIN";
PGPASSWORD=$rootPass psql -h $server -U $rootUser $database  -c "
CREATE SCHEMA transportiq;
CREATE SCHEMA IF NOT EXISTS transportiq;
ALTER SCHEMA transportiq OWNER TO postgres;
ALTER SCHEMA public OWNER TO xxx;
GRANT ALL ON SCHEMA transportiq TO xxx;
GRANT ALL ON SCHEMA public TO xxx;
GRANT ALL ON TABLES public TO xxx;
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM xxx;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO xxx;
GRANT ALL ON ALL TABLES IN SCHEMA public TO xxx;
ALTER SCHEMA transportiq OWNER TO xxx;
DROP EXTENSION IF EXISTS dblink;
CREATE EXTENSION dblink SCHEMA transportiq;
";


PGPASSWORD=$rootPass psql -h $server -U $rootUser $database  -f /Users/kian/git/sql/Db/deploy/countries/countries.sql;
PGPASSWORD=$rootPass psql -h $server -U $rootUser $database  -f /Users/kian/git/sql/Db/deploy/diagrams/diagrams.sql;
PGPASSWORD=$rootPass psql -h $server -U $rootUser $database  -f /Users/kian/git/sql/Db/deploy/leaders/leaders.sql;
