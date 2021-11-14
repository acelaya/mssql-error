<?php

declare(strict_types=1);

var_dump(PHP_VERSION);

$pdo = new PDO('sqlsrv:server=mssql,1433;Database=shlink_test', 'sa', 'Passw0rd!');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$st = $pdo->prepare(
    'INSERT INTO domains (authority, base_url_redirect, regular_not_found_redirect, invalid_short_url_redirect) VALUES (?, ?, ?, ?)'
);
$authority = 'foo.com';
$base = null;
$notFound = null;
$invalid = null;
$st->bindParam(1, $authority);
$st->bindParam(2, $base);
$st->bindParam(3, $notFound);
$st->bindParam(4, $invalid);
$st->execute();

$authority = 'detached-with-redirects.com';
$base = 'foo.com';
$notFound = 'bar.com';
$invalid = null;
$st->bindParam(1, $authority);
$st->bindParam(2, $base);
$st->bindParam(3, $notFound);
$st->bindParam(4, $invalid);
$st->execute();
