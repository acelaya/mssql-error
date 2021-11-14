FROM php:8.1.0RC6-alpine3.14

ENV PDO_SQLSRV_VERSION 5.10.0beta1
ENV MS_ODBC_SQL_VERSION 17.5.2.2
ENV LC_ALL "C"

RUN \
  wget https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_${MS_ODBC_SQL_VERSION}-1_amd64.apk && \
  apk add --allow-untrusted msodbcsql17_${MS_ODBC_SQL_VERSION}-1_amd64.apk && \
  apk add --no-cache --virtual .phpize-deps ${PHPIZE_DEPS} unixodbc-dev && \
  pecl install pdo_sqlsrv-${PDO_SQLSRV_VERSION} && \
  docker-php-ext-enable pdo_sqlsrv && \
  apk del .phpize-deps && \
  rm msodbcsql17_${MS_ODBC_SQL_VERSION}-1_amd64.apk
