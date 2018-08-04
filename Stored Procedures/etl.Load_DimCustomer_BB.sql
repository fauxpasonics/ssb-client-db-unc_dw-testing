SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [etl].[Load_DimCustomer_BB]
AS 


SELECT CONSTITUENTID
	, ADDRESSTYPE
	, CAST(MAX(CAST(DONOTMAIL AS INT)) AS BIT) DoNotMail
	, MAX(DateChanged) DateChanged
INTO #Addresses
FROM ods.BB_ADDRESS
WHERE IsActive = 1
GROUP BY CONSTITUENTID, ADDRESSTYPE;
CREATE NONCLUSTERED INDEX idx_tmpAddresses_CONSTITUENTID ON #Addresses(CONSTITUENTID);


SELECT CONSTITUENTID
	, PHONETYPE
	, CAST(MAX(CAST(DoNotCall AS INT)) AS BIT) DoNotCall
	, MAX(DateChanged) DateChanged
INTO #Phones
FROM ods.BB_PHONE
GROUP BY CONSTITUENTID, PHONETYPE;
CREATE NONCLUSTERED INDEX idx_tmpPhones_CONSTITUENTID ON #Phones(CONSTITUENTID);


SELECT CONSTITUENTID
	, EmailTYPE
	, CAST(MAX(CAST(DONOTEMAIL AS INT)) AS BIT) DoNotEmail
	, MAX(DateChanged) DateChanged
INTO #Emails
FROM ods.BB_EMAILADDRESS
GROUP BY CONSTITUENTID, EMAILTYPE;
CREATE NONCLUSTERED INDEX idx_tmpEmails_CONSTITUENTID ON #Emails(CONSTITUENTID);


SELECT *
INTO #primadd
FROM ods.BB_ADDRESS (NOLOCK)
WHERE ISPRIMARY = 1
	AND ISACTIVE = 1
	AND HistoricalEndDate IS NULL;
CREATE NONCLUSTERED INDEX idx_tmpPrimAdd_CONSTITUENTID ON #primadd(CONSTITUENTID);


SELECT a.*
INTO #home
FROM ods.BB_Address a (NOLOCK)
JOIN #Addresses b
ON a.ConstituentID = b.ConstituentID
	AND a.AddressType = b.AddressType
	AND a.DateChanged = b.DateChanged
WHERE a.AddressType = 'Home Mailing'
AND a.HistoricalEndDate IS NULL;
CREATE NONCLUSTERED INDEX idx_tmpHome_CONSTITUENTID ON #home(CONSTITUENTID);


SELECT a.*
INTO #bus
FROM ods.BB_Address a (NOLOCK)
JOIN #Addresses b
ON a.ConstituentID = b.ConstituentID
	AND a.AddressType = b.AddressType
	AND a.DateChanged = b.DateChanged
WHERE a.AddressType = 'Business Mailing'
AND a.HistoricalEndDate IS NULL;
CREATE NONCLUSTERED INDEX idx_tmpBus_CONSTITUENTID ON #bus(CONSTITUENTID);


SELECT a.*
INTO #homeprev
FROM ods.BB_Address a (NOLOCK)
JOIN #Addresses b
ON a.ConstituentID = b.ConstituentID
	AND a.AddressType = b.AddressType
	AND a.DateChanged = b.DateChanged
WHERE a.AddressType = 'Previous Home'
AND a.HistoricalEndDate IS NULL;
CREATE NONCLUSTERED INDEX idx_tmpHomePrev_CONSTITUENTID ON #homeprev(CONSTITUENTID);


SELECT a.*
INTO #busprev
FROM ods.BB_Address a (NOLOCK)
JOIN #Addresses b
ON a.ConstituentID = b.ConstituentID
	AND a.AddressType = b.AddressType
	AND a.DateChanged = b.DateChanged
WHERE a.AddressType = 'Previous Business'
AND a.HistoricalEndDate IS NULL;
CREATE NONCLUSTERED INDEX idx_tmpBusPrev_CONSTITUENTID ON #busprev(CONSTITUENTID);


SELECT *
INTO #primphone
FROM ods.BB_Phone (NOLOCK)
WHERE IsPrimary = 1
	AND EndDate IS NULL;
CREATE NONCLUSTERED INDEX idx_tmpPrimPhone_CONSTITUENTID ON #primphone(CONSTITUENTID);


SELECT a.*
into #homePhone
FROM ods.BB_Phone a (NOLOCK)
JOIN #Phones b
ON a.constituentid = b.constituentid
	AND a.phonetype = b.phonetype
	AND a.datechanged = b.datechanged
WHERE a.phonetype = 'Home'
AND a.EndDate IS NULL;
CREATE NONCLUSTERED INDEX idx_tmpHomePhone_CONSTITUENTID ON #homePhone(CONSTITUENTID);


SELECT a.*
into #busPhone
FROM ods.BB_Phone a (NOLOCK)
JOIN #Phones b
ON a.constituentid = b.constituentid
	AND a.phonetype = b.phonetype
	AND a.datechanged = b.datechanged
WHERE a.phonetype = 'Business'
AND a.EndDate IS NULL;
CREATE NONCLUSTERED INDEX idx_tmpBusPhone_CONSTITUENTID ON #busPhone(CONSTITUENTID);


SELECT a.*
into #cellPhone
FROM ods.BB_Phone a (NOLOCK)
JOIN #Phones b
ON a.constituentid = b.constituentid
	AND a.phonetype = b.phonetype
	AND a.datechanged = b.datechanged
WHERE a.phonetype = 'Mobile'
AND a.EndDate IS NULL;
CREATE NONCLUSTERED INDEX idx_tmpCellPhone_CONSTITUENTID ON #cellPhone(CONSTITUENTID);


SELECT a.*
into #faxPhone
FROM ods.BB_Phone a (NOLOCK)
JOIN #Phones b
ON a.constituentid = b.constituentid
	AND a.phonetype = b.phonetype
	AND a.datechanged = b.datechanged
WHERE a.phonetype = 'Fax'
AND a.EndDate IS NULL;
CREATE NONCLUSTERED INDEX idx_tmpFaxPhone_CONSTITUENTID ON #faxPhone(CONSTITUENTID);


SELECT a.*
into #personalemail
FROM ods.BB_EmailAddress a (NOLOCK)
JOIN #Emails b
ON a.constituentid = b.constituentid
	AND a.Emailtype = b.Emailtype
	AND a.datechanged = b.datechanged
WHERE a.Emailtype = 'Personal'
AND a.EndDate IS NULL;
CREATE NONCLUSTERED INDEX idx_tmpPersonalEmail_CONSTITUENTID ON #personalemail(CONSTITUENTID);


SELECT a.*
into #busemail
FROM ods.BB_EmailAddress a (NOLOCK)
JOIN #Emails b
ON a.constituentid = b.constituentid
	AND a.Emailtype = b.Emailtype
	AND a.datechanged = b.datechanged
WHERE a.Emailtype = 'Business'
AND a.EndDate IS NULL;
CREATE NONCLUSTERED INDEX idx_tmpBusEmail_CONSTITUENTID ON #busemail(CONSTITUENTID);


SELECT *
into #primemail
FROM ods.BB_EmailAddress (NOLOCK)
WHERE IsPrimary = 1
AND EndDate IS NULL;
CREATE NONCLUSTERED INDEX idx_tmpPrimEmail_CONSTITUENTID ON #primemail(CONSTITUENTID);


SELECT ConstituentID, MAX(DateChanged) UpdatedDate
into #updatedate
FROM (
	SELECT ConstituentID, DateChanged
	FROM ods.BB_ADDRESS (NOLOCK)
	UNION ALL 
	SELECT ConstituentID, DateChanged
	FROM ods.BB_Phone (NOLOCK)
	UNION ALL 
	SELECT ConstituentID, DateChanged
	FROM ods.BB_EmailAddress (NOLOCK)
) a
GROUP BY ConstituentID;
CREATE NONCLUSTERED INDEX idx_tmpUpdateDate_CONSTITUENTID ON #updatedate(CONSTITUENTID);


------------------------------------------------------------------------------------------------------

TRUNCATE TABLE dbo.Load_DimCustomer_BB;



INSERT dbo.Load_DimCustomer_BB (ID, PRIMARYCONSTITUENCY, PRIMARY_EMPLOYER, INDIVIDUALFORMALSALUTATION, INDIVIDUALINFORMALADDRESSEE, INDIVIDUALFORMALADDRESSEE, BirthDate, GENDER, Name, Title, FIRSTNAME, LastName, MiddleName, Suffix, primadd_ADDRESSLINE1, primadd_ADDRESSLINE2, primadd_ADDRESSLINE3, primadd_ADDRESSLINE4, primadd_City, primadd_STATECODE, primadd_ZIPCODE, primadd_COUNTRY, primadd_DoNotMail, home_ADDRESSLINE1, home_ADDRESSLINE2, home_ADDRESSLINE3, home_ADDRESSLINE4, home_City, home_STATECODE, home_ZIPCODE, home_COUNTRY, home_DoNotMail, bus_ADDRESSLINE1, bus_ADDRESSLINE2, bus_ADDRESSLINE3, bus_ADDRESSLINE4, bus_City, bus_STATECODE, bus_ZIPCODE, bus_COUNTRY, bus_DoNotMail, homeprev_ADDRESSLINE1, homeprev_ADDRESSLINE2, homeprev_ADDRESSLINE3, homeprev_ADDRESSLINE4, homeprev_City, homeprev_STATECODE, homeprev_ZIPCODE, homeprev_COUNTRY, homeprev_DoNotMail, busprev_ADDRESSLINE1, busprev_ADDRESSLINE2, busprev_ADDRESSLINE3, busprev_ADDRESSLINE4, busprev_City, busprev_STATECODE, busprev_ZIPCODE, busprev_COUNTRY, busprev_DoNotMail, Primphone_Number, Primphone_DoNotCall, HomePhone_Number, HomePhone_DoNotCall, CellPhone_Number, CellPhone_DoNotCall, BusPhone_Number, BusPhone_DoNotCall, Faxphone_Number, Faxphone_DoNotCall, primemail_EMAILADDRESS, primemail_DoNotEmail, personalemail_EMAILADDRESS, personalemail_DoNotEmail, busemail_EMAILADDRESS, busemail_DoNotEmail, DECEASEDCONFIRMATIONCODE, ISINACTIVE, HOUSEHOLDID, HOUSEHOLDLOOKUPID, ISPRIMARYMEMBER, ETL_CreatedDate, ETL_IsDeleted, ETL_DeletedDate, UpdatedDate, LOOKUPID, DoNotPhone)

SELECT c.ID
	, c.PRIMARYCONSTITUENCY
	, c.PRIMARY_EMPLOYER
	, c.INDIVIDUALFORMALSALUTATION
	, c.INDIVIDUALINFORMALADDRESSEE
	, c.INDIVIDUALFORMALADDRESSEE
	, c.BirthDate
	, c.GENDER
	, c.Name
	, c.Title
	, c.FIRSTNAME
	, c.LastName
	, c.MiddleName
	, c.Suffix


	, primadd.ADDRESSLINE1 as primadd_ADDRESSLINE1
	, primadd.ADDRESSLINE2 as primadd_ADDRESSLINE2
	, primadd.ADDRESSLINE3 as primadd_ADDRESSLINE3
	, primadd.ADDRESSLINE4 as primadd_ADDRESSLINE4
	, primadd.City		   as primadd_City
	, primadd.STATECODE	   as primadd_STATECODE
	, primadd.ZIPCODE	   as primadd_ZIPCODE
	, primadd.COUNTRY	   as primadd_COUNTRY
	, primadd.DoNotMail	   as primadd_DoNotMail
	
	
	, home.ADDRESSLINE1 as home_ADDRESSLINE1
	, home.ADDRESSLINE2 as home_ADDRESSLINE2
	, home.ADDRESSLINE3 as home_ADDRESSLINE3
	, home.ADDRESSLINE4 as home_ADDRESSLINE4
	, home.City		    as home_City
	, home.STATECODE    as home_STATECODE
	, home.ZIPCODE	    as home_ZIPCODE
	, home.COUNTRY	    as home_COUNTRY
	, home.DoNotMail    as home_DoNotMail
	

	, bus.ADDRESSLINE1 as bus_ADDRESSLINE1
	, bus.ADDRESSLINE2 as bus_ADDRESSLINE2
	, bus.ADDRESSLINE3 as bus_ADDRESSLINE3
	, bus.ADDRESSLINE4 as bus_ADDRESSLINE4
	, bus.City		   as bus_City
	, bus.STATECODE	   as bus_STATECODE
	, bus.ZIPCODE	   as bus_ZIPCODE
	, bus.COUNTRY	   as bus_COUNTRY
	, bus.DoNotMail	   as bus_DoNotMail
	

	, homeprev.ADDRESSLINE1 as homeprev_ADDRESSLINE1
	, homeprev.ADDRESSLINE2 as homeprev_ADDRESSLINE2
	, homeprev.ADDRESSLINE3 as homeprev_ADDRESSLINE3
	, homeprev.ADDRESSLINE4 as homeprev_ADDRESSLINE4
	, homeprev.City		    as homeprev_City
	, homeprev.STATECODE    as homeprev_STATECODE
	, homeprev.ZIPCODE	    as homeprev_ZIPCODE
	, homeprev.COUNTRY	    as homeprev_COUNTRY
	, homeprev.DoNotMail    as homeprev_DoNotMail
	
		
	, busprev.ADDRESSLINE1 as busprev_ADDRESSLINE1
	, busprev.ADDRESSLINE2 as busprev_ADDRESSLINE2
	, busprev.ADDRESSLINE3 as busprev_ADDRESSLINE3
	, busprev.ADDRESSLINE4 as busprev_ADDRESSLINE4
	, busprev.City		   as busprev_City
	, busprev.STATECODE	   as busprev_STATECODE
	, busprev.ZIPCODE	   as busprev_ZIPCODE
	, busprev.COUNTRY	   as busprev_COUNTRY
	, busprev.DoNotMail	   as busprev_DoNotMail
			

	, Primphone.Number    as Primphone_Number
	, Primphone.DoNotCall as Primphone_DoNotCall
	, HomePhone.Number	  as HomePhone_Number
	, HomePhone.DoNotCall as HomePhone_DoNotCall
	, CellPhone.Number	  as CellPhone_Number
	, CellPhone.DoNotCall as CellPhone_DoNotCall
	, BusPhone.Number	  as BusPhone_Number
	, BusPhone.DoNotCall  as BusPhone_DoNotCall
	, Faxphone.Number	  as Faxphone_Number
	, Faxphone.DoNotCall  as Faxphone_DoNotCall
	
	
	, primemail.EMAILADDRESS     as primemail_EMAILADDRESS
	, primemail.DoNotEmail		 as primemail_DoNotEmail
	, personalemail.EMAILADDRESS as personalemail_EMAILADDRESS
	, personalemail.DoNotEmail	 as personalemail_DoNotEmail
	, busemail.EMAILADDRESS		 as busemail_EMAILADDRESS
	, busemail.DoNotEmail		 as busemail_DoNotEmail


	, c.DECEASEDCONFIRMATIONCODE
	, c.ISINACTIVE 
	, h.HOUSEHOLDID
	, h.HOUSEHOLDLOOKUPID
	, h.ISPRIMARYMEMBER


	, c.ETL_CreatedDate
	, c.ETL_IsDeleted
	, c.ETL_DeletedDate
	, UpdateDate.UpdatedDate
	, c.LOOKUPID
	, c.DoNotPhone

FROM ods.BB_CONSTITUENT c (NOLOCK)
LEFT JOIN #primadd as primadd
	ON c.id = primadd.CONSTITUENTID
LEFT JOIN #home as home
	ON home.constituentId = c.ID
LEFT JOIN #bus as bus
	ON bus.constituentId = c.ID	
LEFT JOIN #homeprev as homeprev
	ON homeprev.constituentId = c.ID
LEFT JOIN #busprev as busprev
	ON busprev.constituentId = c.ID
LEFT JOIN #primphone as Primphone
	ON primphone.constituentid = c.id
LEFT JOIN #homePhone as Homephone
	ON homephone.constituentid = c.id
LEFT JOIN #busPhone as Busphone
	ON Busphone.constituentid = c.id
LEFT JOIN #cellPhone as cellphone
	ON cellphone.constituentid = c.id
LEFT JOIN #faxPhone as Faxphone
	ON faxphone.constituentid = c.id
LEFT JOIN #personalemail as personalemail
	ON personalemail.constituentid = c.id
LEFT JOIN #busemail as busemail
	ON busemail.constituentid = c.id
LEFT JOIN #primemail as primemail
	ON primemail.constituentid = c.id
LEFT JOIN ods.BB_Household h
	ON c.id = h.id
LEFT JOIN #updatedate as UpdateDate
	ON c.ID = UpdateDate.ConstituentID
WHERE c.ETL_UpdatedDate > DATEADD(DAY,-3,GETDATE());




GO
