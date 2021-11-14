## Steps

* Clone repository.
* Build containers: `docker-compose build && docker-compose up -d`
* Create empty database:
  * `docker-compose exec -T mssql /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'Passw0rd!' -Q "CREATE DATABASE shlink_test;"`
  * `docker-compose exec -T mssql /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'Passw0rd!' -i /testdata/ddl.sql`
* Run script on PHP 8.0 + pdo_sqlsrv 5.9: `docker-compose run php_80 php /testdata/script.php`
  * **SUCCESS**
* Run script on PHP 8.1 RC6 + pdo_sqlsrv 5.10.0beta1: `docker-compose run php_81 php /testdata/script.php`
  * **ERROR**
