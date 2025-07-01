/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

-- This is Script.PostDeployment.sql

:r ..\Seeds\Common\SeedCommunicationModes.sql
:r ..\Seeds\Common\SeedContinents.sql


IF '$(Environment)' = 'DEV'
BEGIN
    :r ..\Seeds\DEV\SeedSampleLastCalls.DEV.sql
    :r ..\Seeds\DEV\SeedSampleMonthlyCalls.DEV.sql
    :r ..\Seeds\DEV\SeedSamplePeople.DEV.sql
    :r ..\Seeds\DEV\SeedSampleYearlyCalls.DEV.sql
END

