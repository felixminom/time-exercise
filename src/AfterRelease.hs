module AfterRelease () where

import Data.Time.Calendar
import Data.Time.Calendar.Month
import Data.Time.Calendar.Quarter
import Data.Time.Calendar.MonthDay
import Data.Time.Calendar.OrdinalDate

type QuarterFirstDay = Day
type QuarterLastDay  = Day

allQuartersBoundaries :: Year -> [(QuarterFirstDay, QuarterLastDay)]
allQuartersBoundaries y =
    map (\q -> (periodFirstDay $ getQuarter q, periodLastDay $ getQuarter q)) [Q1,Q2,Q3,Q4]
    where
        getQuarter q = YearQuarter y q

type QuarterLength = Int

allQuarterLength :: Year -> [QuarterLength]
allQuarterLength y = map (\q -> periodLength $ YearQuarter y q) [Q1,Q2,Q3,Q4]

allDaysQuarter :: Year -> QuarterOfYear -> [Day]
allDaysQuarter y q = periodAllDays $ YearQuarter y q

type MonthFirstDay = Day
type MonthLastDay  = Day

allMonthsBoundaries :: Year -> [(MonthFirstDay, MonthLastDay)]
allMonthsBoundaries y =
    map (\m -> (periodFirstDay $ YearMonth y m, periodLastDay $ YearMonth y m))  [January .. December]

allDaysMonth :: Year -> MonthOfYear -> [Day]
allDaysMonth y m = periodAllDays $ YearMonth y m
