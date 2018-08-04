SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_DimTicketCustomer]
WITH SCHEMABINDING
AS
SELECT  DimTicketCustomerId ,
        ETL__SSID ,
        ETL__SSID_PATRON ,
		ETL__SourceSystem,
        DimRepId ,
        CAST(IsCompany AS INT) AS IsCompany ,
        CompanyName ,
        FullName ,
        TicketCustomerClass ,
        Status ,
        CustomerId ,
        VIPCode ,
        CAST(IsVIP AS INT) IsVIP ,
        Tag ,
        AccountType ,
        Keywords ,
        Gender ,
        AddDateTime ,
        SinceDate ,
        Birthday ,
        Email ,
        Phone ,
        AddressStreet1 ,
        AddressStreet2 ,
        AddressCity ,
        AddressState ,
        AddressZip ,
        AddressCountry
FROM dbo.DimTicketCustomer  (NOLOCK)      

GO
