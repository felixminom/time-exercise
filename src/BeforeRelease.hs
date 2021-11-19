module BeforeRelease () where

import Data.Time.Calendar
import Data.Time.Calendar.Month
import Data.Time.Calendar.Quarter
import Data.Time.Calendar.MonthDay
import Data.Time.Calendar.OrdinalDate

-- These are some options to get boundaries

type MonthFirstDay = Day
type MonthLastDay  = Day

monthBoundaries :: Day -> (MonthFirstDay, MonthLastDay)
monthBoundaries day = let (y, m , _) = toGregorian day
    in (fromGregorian y m 1, fromGregorian y m 31)

monthBoundariesByYear :: Year -> [(MonthFirstDay, MonthLastDay)]
monthBoundariesByYear year =
    case isLeapYear year of
        True  -> monthBoundariesByYear' True year
        False -> monthBoundariesByYear' False year

monthBoundariesByYear' :: Bool -> Year -> [(MonthFirstDay, MonthLastDay)]
monthBoundariesByYear' isLeap year =
    map (\m -> (fromGregorian year m 1, fromGregorian year m 31)) [January .. December]

-- Get month boundaries
-- startDay = addDays (negate $ (toInteger $ thd3 (toGregorian today)) - 1) today
-- endDay   = addDays (toInteger $ (monthLength (isLeapYear (fst3 (toGregorian today))) (snd3 (toGregorian today))) - (thd3 (toGregorian today))) today
