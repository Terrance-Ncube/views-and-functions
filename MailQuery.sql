Execute sysmail_add_profile_sp 
@profile_name = 'Terrance mail list',
@description = 'primary emal profile'

CREATE USER Lwethu FOR LOGIN  [Lwethu];
GO
EXEC sp_addrolemember N'DatabaseMailUserRole', 'Lwethu'

Execute sysmail_add_account_sp 
@account_name = 'TerranceAccount', 
@email_address = 'teemann95@gmail.com',
@display_name = 'local mail list', 
@replyto_address = 'teemann95@gmail.com',
@description = 'daily mail', 
@mailserver_name = 'smtp.gmail.com', 
@mailserver_type = 'SMTP', 
@port = ' 587', 
@username = 'teemann95@gmail.com', 
@password = 'NotSureIfNecessary', 
@enable_ssl = 1;

Execute sysmail_add_profileaccount_sp
@profile_name = 'Terrance mail list',
@account_name = 'TerranceAccount',
@sequence_number =1

EXEC sp_configure 'Database Mail XPs', 1
go
reconfigure
go

EXEC msdb.dbo.sp_send_dbmail 
@recipients = 'teemann95@gmail.com',
@subject = 'Test mail',
@body = 'this is a test',
@profile_name = 'Terrance mail list'