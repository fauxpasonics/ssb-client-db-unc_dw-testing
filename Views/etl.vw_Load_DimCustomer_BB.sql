SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




/*****Hash Rules for Reference******
WHEN 'int' THEN 'ISNULL(RTRIM(CONVERT(varchar(10),' + COLUMN_NAME + ')),''DBNULL_INT'')'
WHEN 'bigint' THEN 'ISNULL(RTRIM(CONVERT(varchar(10),' + COLUMN_NAME + ')),''DBNULL_BIGINT'')'
WHEN 'datetime' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),' + COLUMN_NAME + ')),''DBNULL_DATETIME'')'  
WHEN 'datetime2' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),' + COLUMN_NAME + ')),''DBNULL_DATETIME'')'
WHEN 'date' THEN 'ISNULL(RTRIM(CONVERT(varchar(10),' + COLUMN_NAME + ',112)),''DBNULL_DATE'')' 
WHEN 'bit' THEN 'ISNULL(RTRIM(CONVERT(varchar(10),' + COLUMN_NAME + ')),''DBNULL_BIT'')'  
WHEN 'decimal' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),'+ COLUMN_NAME + ')),''DBNULL_NUMBER'')' 
WHEN 'numeric' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),'+ COLUMN_NAME + ')),''DBNULL_NUMBER'')' 
ELSE 'ISNULL(RTRIM(' + COLUMN_NAME + '),''DBNULL_TEXT'')'
*****/



CREATE VIEW [etl].[vw_Load_DimCustomer_BB]
AS 


	SELECT *
	/*Name*/
	, HASHBYTES('sha2_256',
							ISNULL(RTRIM(FullName),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(Prefix),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(FirstName),'DBNULL_TEXT')
							+ ISNULL(RTRIM(MiddleName),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(LastName),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(Suffix),'DBNULL_TEXT')
							+ ISNULL(RTRIM(CompanyName),'DBNULL_TEXT')
							) AS [NameDirtyHash]
	, 'Dirty' AS [NameIsCleanStatus]
	, NULL AS [NameMasterId]

	/*Address*/
	/*Address*/
	, HASHBYTES('sha2_256', ISNULL(RTRIM(AddressPrimaryStreet),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressPrimarySuite),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(AddressPrimaryCity),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressPrimaryState),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AddressPrimaryZip),'DBNULL_TEXT') 
							---+ ISNULL(RTRIM(AddressPrimaryCounty),'DBNULL_TEXT')
							---+ ISNULL(RTRIM(AddressPrimaryCountry),'DBNULL_TEXT')
							) AS [AddressPrimaryDirtyHash]
	, 'Dirty' AS [AddressPrimaryIsCleanStatus]
	, NULL AS [AddressPrimaryMasterId]
	, HASHBYTES('sha2_256', ISNULL(RTRIM(AddressOneStreet),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(AddressOneSuite),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(AddressOneCity),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressOneState),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AddressOneZip),'DBNULL_TEXT') 
							---+ ISNULL(RTRIM(AddressOneCounty),'DBNULL_TEXT')
							---+ ISNULL(RTRIM(AddressOneCountry),'DBNULL_TEXT')
							) AS [AddressOneDirtyHash]
	, 'Dirty' AS [AddressOneIsCleanStatus]
	, NULL AS [AddressOneMasterId]
	, HASHBYTES('sha2_256', ISNULL(RTRIM(AddressTwoStreet),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(AddressTwoSuite),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(AddressTwoCity),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressTwoState),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AddressTwoZip),'DBNULL_TEXT')
							---+ ISNULL(RTRIM(AddressTwoCounty),'DBNULL_TEXT') 
							---+ ISNULL(RTRIM(AddressTwoCountry),'DBNULL_TEXT')
							) AS [AddressTwoDirtyHash]
	, 'Dirty' AS [AddressTwoIsCleanStatus]
	, NULL AS [AddressTwoMasterId]
	, HASHBYTES('sha2_256', ISNULL(RTRIM(AddressThreeStreet),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressThreeSuite),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AddressThreeCity),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressThreeState),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AddressThreeZip),'DBNULL_TEXT') 
							---+ ISNULL(RTRIM(AddressThreeCounty),'DBNULL_TEXT')
							---+ ISNULL(RTRIM(AddressThreeCountry),'DBNULL_TEXT')
							) AS [AddressThreeDirtyHash]
	, 'Dirty' AS [AddressThreeIsCleanStatus]
	, NULL AS [AddressThreeMasterId]
	, HASHBYTES('sha2_256', ISNULL(RTRIM(AddressFourStreet),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressFourSuite),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AddressFourCity),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressFourState),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AddressFourZip),'DBNULL_TEXT')
							---+ ISNULL(RTRIM(AddressFourCounty),'DBNULL_TEXT') 
							---+ ISNULL(RTRIM(AddressFourCountry),'DBNULL_TEXT')
							) AS [AddressFourDirtyHash]
	, 'Dirty' AS [AddressFourIsCleanStatus]
	, NULL AS [AddressFourMasterId]

	/*Contact*/
	, NULL AS [ContactDirtyHash]
	, CAST(NULL AS UNIQUEIDENTIFIER) AS [ContactGuid]

	/*Phone*/
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(PhonePrimary),'DBNULL_TEXT')) AS [PhonePrimaryDirtyHash]
	, 'Dirty' AS [PhonePrimaryIsCleanStatus]
	, NULL AS [PhonePrimaryMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(PhoneHome),'DBNULL_TEXT')) AS [PhoneHomeDirtyHash]
	, 'Dirty' AS [PhoneHomeIsCleanStatus]
	, NULL AS [PhoneHomeMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(PhoneCell),'DBNULL_TEXT')) AS [PhoneCellDirtyHash]
	, 'Dirty' AS [PhoneCellIsCleanStatus]
	, NULL AS [PhoneCellMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(PhoneBusiness),'DBNULL_TEXT')) AS [PhoneBusinessDirtyHash]
	, 'Dirty' AS [PhoneBusinessIsCleanStatus]
	, NULL AS [PhoneBusinessMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(PhoneFax),'DBNULL_TEXT')) AS [PhoneFaxDirtyHash]
	, 'Dirty' AS [PhoneFaxIsCleanStatus]
	, NULL AS [PhoneFaxMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(PhoneOther),'DBNULL_TEXT')) AS [PhoneOtherDirtyHash]
	, 'Dirty' AS [PhoneOtherIsCleanStatus]
	, NULL AS [PhoneOtherMasterId]

	/*Email*/
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(EmailPrimary),'DBNULL_TEXT')) AS [EmailPrimaryDirtyHash]
	, 'Dirty' AS [EmailPrimaryIsCleanStatus]
	, NULL AS [EmailPrimaryMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(EmailOne),'DBNULL_TEXT')) AS [EmailOneDirtyHash]
	, 'Dirty' AS [EmailOneIsCleanStatus]
	, NULL AS [EmailOneMasterId]
	, HASHBYTES('sha2_256',	ISNULL(RTRIM(EmailTwo),'DBNULL_TEXT')) AS [EmailTwoDirtyHash]
	, 'Dirty' AS [EmailTwoIsCleanStatus]
	, NULL AS [EmailTwoMasterId]

	, HASHBYTES('sha2_256', ISNULL(RTRIM(customerType),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(CustomerStatus),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AccountType),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(AccountRep),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(CompanyName),'DBNULL_TEXT')
							+ ISNULL(RTRIM(SalutationName),'DBNULL_TEXT')
							+ ISNULL(RTRIM(DonorMailName),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(DonorFormalName),'DBNULL_TEXT')
							+ ISNULL(RTRIM(Birthday),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(Gender),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(AccountId),'DBNULL_TEXT')
							+ ISNULL(RTRIM(MergedRecordFlag),'DBNULL_TEXT')
							+ ISNULL(RTRIM(MergedIntoSSID),'DBNULL_TEXT')
							+ ISNULL(RTRIM(IsBusiness),'DBNULL_TEXT')) AS [contactattrDirtyHash]

	, HASHBYTES('sha2_256', ISNULL(RTRIM(ExtAttribute1),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute2),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute3),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute4),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute5),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute6),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute7),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute8),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute9),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute10),'DBNULL_TEXT') 
							) AS [extattr1_10DirtyHash]

							, HASHBYTES('sha2_256', ISNULL(RTRIM(ExtAttribute11),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute12),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute13),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute14),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute15),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute16),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute17),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute18),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute19),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute20),'DBNULL_TEXT') 
							) AS [extattr11_20DirtyHash]

							
	, HASHBYTES('sha2_256', ISNULL(RTRIM(ExtAttribute21),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute22),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute23),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute24),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute25),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute26),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute27),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute28),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute29),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute30),'DBNULL_TEXT') 
							) AS [extattr21_30DirtyHash]

							
	, HASHBYTES('sha2_256', ISNULL(RTRIM(ExtAttribute31),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute32),'DBNULL_TEXT')
							+ ISNULL(RTRIM(ExtAttribute33),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(ExtAttribute34),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(ExtAttribute35),'DBNULL_TEXT')
							) AS [extattr31_35DirtyHash]
	
	FROM (
--base set

		SELECT 
			'UNC' AS [SourceDB]
			, 'Blackbaud' AS [SourceSystem]
			, NULL AS [SourceSystemPriority]

			/*Standard Attributes*/
			, CAST(ID AS NVARCHAR(50)) [SSID]
			, CAST(PRIMARYCONSTITUENCY AS NVARCHAR(50)) AS [CustomerType]
			, (CASE WHEN IsInactive = 1 THEN 'Inactive'
				ELSE 'Active' END) AS [CustomerStatus]
			, CAST(NULL AS NVARCHAR(50)) AS [AccountType] 
			, CAST(NULL AS NVARCHAR(50)) AS [AccountRep] 
			, CAST(PRIMARY_EMPLOYER AS NVARCHAR(50)) AS [CompanyName] 
			, INDIVIDUALFORMALSALUTATION AS [SalutationName]
			, INDIVIDUALINFORMALADDRESSEE AS [DonorMailName]
			, INDIVIDUALFORMALADDRESSEE AS [DonorFormalName]
			, TRY_CAST(BirthDate AS DATE) AS [Birthday]
			, GENDER AS [Gender] 
			, 0 [MergedRecordFlag]
			, NULL [MergedIntoSSID]

			/**ENTITIES**/
			/*Name*/			
			, CASE WHEN LEFT([Name],200) <> '' THEN LEFT([name],200)
				ELSE NULL END AS FullName
			, CASE WHEN LEFT(Title,100) <> '' THEN LEFT(TITLE,100)
				ELSE NULL END AS [Prefix]
			, CASE WHEN FIRSTNAME <> '' THEN FIRSTNAME
				ELSE NULL END AS [FirstName]
			, CASE WHEN LastName <> '' THEN LASTNAME
				ELSE NULL END AS [LastName]
			, CASE WHEN MiddleName <> '' THEN MIDDLENAME
				ELSE NULL END AS [MiddleName]		
			, CASE WHEN LEFT(Suffix,100) <> '' THEN LEFT(Suffix,100)
				ELSE NULL END AS [Suffix]
			, CASE WHEN title <> '' THEN TITLE
				ELSE NULL END AS [Title]

			/*AddressPrimary*/
			, CAST(ISNULL(primadd_ADDRESSLINE1,'') + ' ' + ISNULL(primadd_ADDRESSLINE2,'') + ' ' + ISNULL(primadd_ADDRESSLINE3,'') + ' ' + ISNULL(primadd_ADDRESSLINE4,'') AS VARCHAR(500)) AS [AddressPrimaryStreet]
			, NULL AS AddressPrimarySuite
			, CASE WHEN primadd_City <> '' THEN primadd_CITY
				ELSE NULL END AS [AddressPrimaryCity] 
			, CASE WHEN primadd_STATECODE <> '' THEN primadd_STATECODE
				ELSE NULL END AS [AddressPrimaryState] 
			, CASE WHEN primadd_ZIPCODE <> '' THEN primadd_ZIPCODE
				ELSE NULL END AS [AddressPrimaryZip] 
			, NULL AS [AddressPrimaryCounty]
			, CASE WHEN primadd_COUNTRY <> '' THEN primadd_COUNTRY
				ELSE NULL END AS [AddressPrimaryCountry] 
			
			, CAST(ISNULL(home_ADDRESSLINE1,'') + ' ' + ISNULL(home_ADDRESSLINE2,'') + ' ' + ISNULL(home_ADDRESSLINE3,'') + ' ' + ISNULL(home_ADDRESSLINE4,'') AS VARCHAR(500)) AS [AddressOneStreet]
			, NULL AS AddressOneSuite
			, CASE WHEN home_City <> '' THEN home_CITY
				ELSE NULL END AS [AddressOneCity] 
			, CASE WHEN home_STATECODE <> '' THEN home_STATECODE
				ELSE NULL END AS [AddressOneState] 
			, CASE WHEN home_ZIPCODE <> '' THEN home_ZIPCODE
				ELSE NULL END AS [AddressOneZip] 
			, NULL AS [AddressOneCounty]
			, CASE WHEN home_COUNTRY <> '' THEN home_country
				ELSE NULL END AS [AddressOneCountry] 

			, CAST(ISNULL(bus_ADDRESSLINE1,'') + ' ' + ISNULL(bus_ADDRESSLINE2,'') + ' ' + ISNULL(bus_ADDRESSLINE3,'') + ' ' + ISNULL(bus_ADDRESSLINE4,'') AS VARCHAR(500)) AS [AddressTwoStreet]
			, NULL AS AddressTwoSuite
			, CASE WHEN bus_City <> '' THEN bus_CITY
				ELSE NULL END AS [AddressTwoCity] 
			, CASE WHEN bus_STATECODE <> '' THEN bus_STATECODE
				ELSE NULL END AS [AddressTwoState] 
			, CASE WHEN bus_ZIPCODE <> '' THEN bus_ZIPCODE
				ELSE NULL END AS [AddressTwoZip] 
			, NULL AS [AddressTwoCounty]
			, CASE WHEN bus_COUNTRY <> '' THEN bus_country
				ELSE NULL END AS [AddressTwoCountry] 

			, CAST(ISNULL(homeprev_ADDRESSLINE1,'') + ' ' + ISNULL(homeprev_ADDRESSLINE2,'') + ' ' + ISNULL(homeprev_ADDRESSLINE3,'') + ' ' + ISNULL(homeprev_ADDRESSLINE4,'') AS VARCHAR(500)) AS [AddressThreeStreet]
			, NULL AS AddressThreeSuite
			, CASE WHEN homeprev_City <> '' THEN homeprev_CITY
				ELSE NULL END AS [AddressThreeCity] 
			, CASE WHEN homeprev_STATECODE <> '' THEN homeprev_STATECODE
				ELSE NULL END AS [AddressThreeState] 
			, CASE WHEN homeprev_ZIPCODE <> '' THEN homeprev_ZIPCODE
				ELSE NULL END AS [AddressThreeZip] 
			, NULL AS [AddressThreeCounty]
			, CASE WHEN homeprev_COUNTRY <> '' THEN homeprev_country
				ELSE NULL END AS [AddressThreeCountry] 
			
			, CAST(ISNULL(busprev_ADDRESSLINE1,'') + ' ' + ISNULL(busprev_ADDRESSLINE2,'') + ' ' + ISNULL(busprev_ADDRESSLINE3,'') + ' ' + ISNULL(busprev_ADDRESSLINE4,'') AS VARCHAR(500)) AS [AddressFourStreet]
			, NULL AS AddressFourSuite
			, CASE WHEN busprev_City <> '' THEN busprev_CITY
				ELSE NULL END AS [AddressFourCity] 
			, CASE WHEN busprev_STATECODE <> '' THEN busprev_STATECODE
				ELSE NULL END AS [AddressFourState] 
			, CASE WHEN busprev_ZIPCODE <> '' THEN busprev_ZIPCODE
				ELSE NULL END AS [AddressFourZip] 
			, NULL AS [AddressFourCounty]
			, CASE WHEN busprev_COUNTRY <> '' THEN busprev_country
				ELSE NULL END AS [AddressFourCountry] 

			/*Phone*/

			, CASE WHEN CAST(primphone_Number AS NVARCHAR(25)) <> '' THEN CAST(primphone_Number AS NVARCHAR(25))
				ELSE NULL END AS PhonePrimary
			, CASE WHEN CAST(homephone_Number AS NVARCHAR(25)) <> '' THEN CAST(homephone_Number AS NVARCHAR(25))
				ELSE NULL END AS [PhoneHome]
			, CASE WHEN CAST(cellphone_Number AS NVARCHAR(25)) <> '' THEN CAST(cellphone_Number AS NVARCHAR(25))
				ELSE NULL END AS [PhoneCell]
			, CASE WHEN CAST(BusPhone_Number AS NVARCHAR(25)) <> '' THEN CAST(BusPhone_Number AS NVARCHAR(25))
				ELSE NULL END AS [PhoneBusiness]
			, CASE WHEN CAST(faxphone_Number AS NVARCHAR(25)) <> '' THEN CAST(faxphone_Number AS NVARCHAR(25))
				ELSE NULL END AS [PhoneFax]
			, CAST(NULL AS NVARCHAR(25)) AS [PhoneOther]

			/*Email*/
			, CASE WHEN Primemail_Emailaddress <> '' THEN primemail_EMAILADDRESS
				ELSE NULL END AS [EmailPrimary]
			, CASE WHEN Personalemail_Emailaddress <> '' THEN personalemail_EMAILADDRESS
				ELSE NULL END AS [EmailOne] --phone type E 
			, CASE WHEN busemail_Emailaddress <> '' THEN busemail_EMAILADDRESS
				ELSE NULL END AS [EmailTwo]

			/*Extended Attributes*/
			, CASE WHEN (primadd_DoNotMail = 1
				OR home_DoNotMail = 1
				OR bus_DoNotMail = 1
				OR homeprev_DoNotMail = 1
				OR busprev_DoNotMail = 1) THEN 1
				ELSE 0 END AS[ExtAttribute1] --nvarchar(100)
			, CASE WHEN (primemail_DoNotEmail = 1
				OR busemail_DoNotEmail = 1
				OR personalemail_DoNotEmail = 1) THEN 1
				ELSE 0 END AS[ExtAttribute2] 
			, DECEASEDCONFIRMATIONCODE AS[ExtAttribute3] 
			, ISNULL(ISINACTIVE,0) AS[ExtAttribute4] 
			, NULL AS[ExtAttribute5] 
			, NULL AS[ExtAttribute6] 
			, NULL AS[ExtAttribute7] 
			, HOUSEHOLDID AS[ExtAttribute8] 
			, HOUSEHOLDLOOKUPID AS[ExtAttribute9] 
			, ISPRIMARYMEMBER AS[ExtAttribute10] 

			, NULL AS [ExtAttribute11] 
			, NULL AS [ExtAttribute12] 
			, NULL AS [ExtAttribute13] 
			, NULL AS [ExtAttribute14] 
			, NULL AS [ExtAttribute15] 
			, NULL AS [ExtAttribute16] 
			, NULL AS [ExtAttribute17] 
			, NULL AS [ExtAttribute18] 
			, NULL AS [ExtAttribute19] 
			, NULL AS [ExtAttribute20]  

			, TRY_CAST(BirthDate AS DATE) AS [ExtAttribute21] --datetime
			, NULL AS [ExtAttribute22] 
			, NULL AS [ExtAttribute23] 
			, NULL AS [ExtAttribute24] 
			, NULL AS [ExtAttribute25] 
			, NULL AS [ExtAttribute26] 
			, NULL AS [ExtAttribute27] 
			, NULL AS [ExtAttribute28] 
			, NULL AS [ExtAttribute29] 
			, NULL AS [ExtAttribute30]  

			, primaryconstituency AS [ExtAttribute31]
			, NULL AS [ExtAttribute32]
			, NULL AS [ExtAttribute33]
			, NULL AS [ExtAttribute34]
			, NULL AS [ExtAttribute35]

			/*Source Created and Updated*/
			, NULL [SSCreatedBy]
			, NULL [SSUpdatedBy]
			, NULL [SSCreatedDate]
			, ETL_CreatedDate AS [CreatedDate]
			, ETL_IsDeleted AS IsDeleted
			, ETL_DeletedDate AS DeletedDate
			, CAST(UpdatedDate AS DATE) [SSUpdatedDate]

			, NULL [AccountId]
			, NULL IsBusiness
			, LOOKUPID customer_MatchKey

			/*Do Not Contact*/
			, (CASE WHEN (DoNotPhone = '1'
				OR primphone_DoNotCall = '1'
				OR homephone_DoNotCall = '1'
				OR busphone_DoNotCall = '1'
				OR cellphone_DoNotCall = '1'
				OR faxphone_DoNotCall = '1') THEN 1
				ELSE 0 END) AS DoNotPhone


--		select top 100 *				
		FROM dbo.Load_DimCustomer_BB (NOLOCK)


) a





GO
