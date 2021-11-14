CREATE TABLE shlink_test.dbo.domains (
     id bigint IDENTITY(1,1) NOT NULL,
     authority nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
     base_url_redirect nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
     regular_not_found_redirect nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
     invalid_short_url_redirect nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
     CONSTRAINT PK__domains__3213E83F512B36BA PRIMARY KEY (id)
);
