{-# LANGUAGE PatternSynonyms #-}

module Patterns () where

import Data.Time.Calendar
import Data.Time.Calendar.Month
import Data.Time.Calendar.MonthDay
import Data.Time.Calendar.OrdinalDate

dateToHoliday :: MonthOfYear -> DayOfMonth -> String
dateToHoliday January  _   = "Happy new year!"
dateToHoliday November 1   = "Let's eat colada morada"
dateToHoliday December 25  = "Merry Christmas jojojo"
dateToHoliday _ _          = "Probably just a regular day"
