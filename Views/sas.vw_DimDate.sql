SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_DimDate]
AS
SELECT  DimDateId ,
        CalDate ,
        CalDateFormat ,
        CalDateLabel ,
        CalDateLabelLong ,
        CalYear ,
        CalQuarterNumber ,
        MonthNumber ,
        WeekNumber ,
        DayOfYearNumber ,
        DayOfQuarterNumber ,
        DayOfMonthNumber ,
        DayOfWeekNumber ,
        DayOfWeek ,
        CalQuarter ,
        CalMonth ,
        CalWeek ,
        CalMonthLabel ,
        CalQuarterLabel ,
        CAST(IsWeekend AS INT) AS IsWeekend ,
        CalMonthLastDayFlag ,
        CAST(IsHoliday AS INT) AS IsHoliday ,
        HolidayLabel ,
        FiscalYear ,
        FiscalYearLabel ,
        FiscalQuarter ,
        FiscalQuarterNumber ,
        FiscalQuarterLabel ,
        FiscalMonth ,
        FiscalMonthNumber ,
        FiscalWeek ,
        FiscalDayInYear ,
        FiscalDayInQuarter ,
        UTCOffset
FROM    dbo.DimDate (NOLOCK);    

GO
