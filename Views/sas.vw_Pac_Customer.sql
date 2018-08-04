SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [sas].[vw_Pac_Customer]
AS

SELECT  dc.SSB_CRMSYSTEM_CONTACT_ID ,
        CAST(dc.SSB_CRMSYSTEM_PRIMARY_FLAG AS BIT) SSB_CRMSYSTEM_PRIMARY_FLAG ,
        dc.DimCustomerSSBID ,
        dc.DimCustomerId ,
        dc.SSID AS PatronID ,
        tc.DimTicketCustomerId,
		dc.CustomerType,
		tc.VIPCode,
		tc.IsVIP,
		tc.Keywords,
		tc.SinceDate,
		tc.TicketCustomerClass,
		tc.Status,
		tc.Tag,
		tc.Email,
		tc.IsCompany,
		dc.DoNotMail,
		dc.DoNotEmail,
		dc.DoNotCall,
		dc.CustomerStatus,
		CAST (dc.PIN AS VARCHAR (32)) AS PIN,
		CAST (dc.Linked AS VARCHAR (10)) AS  LINKED,
		dc.NameIsCleanStatus,
		dc.AddressPrimaryIsCleanStatus,
		dc.AddressOneIsCleanStatus,
		dc.AddressTwoIsCleanStatus,
		dc.AddressThreeIsCleanStatus,
		dc.AddressFourIsCleanStatus,
		dc.EmailPrimaryIsCleanStatus,
		dc.EmailOneIsCleanStatus,
		dc.EmailTwoIsCleanStatus,
		dc.PhonePrimaryIsCleanStatus,
		dc.PhoneHomeIsCleanStatus,
		dc.PhoneCellIsCleanStatus,
		dc.PhoneBusinessIsCleanStatus,
		dc.PhoneFaxIsCleanStatus,
		dc.PhoneOtherIsCleanStatus

FROM    sas.vw_DimCustomer dc WITH (NOLOCK) 
JOIN dbo.DimTicketCustomer tc WITH (NOLOCK)
	ON dc.ssid = tc.ETL__SSID AND dc.SourceSystem = tc.ETL__SourceSystem
WHERE   dc.SourceSystem = 'Pac';

GO
