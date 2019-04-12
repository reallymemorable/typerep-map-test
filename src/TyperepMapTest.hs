{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE TypeInType #-}
{-# LANGUAGE AllowAmbiguousTypes #-}

module TyperepMapTest
       ( someFunc
       ) where

import Data.TMap
import Data.TypeRepMap
import Data.Aeson

-- import Data.Dependent.Map


someFunc :: IO ()
someFunc = putStrLn ("someFunc" :: String)


data LoanConfig = LoanConfig
  { _loanConfig_ficoScore :: Int
  }
  deriving (Show, Read, Eq, Ord)


data MortgageConfig = MortgageConfig
  { _mortgageConfig_purpose :: String
  , _mortgageConfig_physicalUnits :: Int
  , _mortgageConfig_loanToValueRatio :: Bool
  }
  deriving (Show, Read, Eq, Ord)



-- toList :: TypeRepMap f -> [SomeTypeRep]
-- toList = map 


newtype TypeRepMap = TypeRepMap {
    unMap :: Map TypeRep Dynamic
  }

instance ToJSON (TypeRepMap f) where
  toJSON (TypeRepMap f) = toJSON f
  toEncoding (TypeRepMap f) = toEncoding f


instance FromJSON (TypeRepMap f) where
  fromJSON (TypeRepMap f) =  fromJSON f
  toEncoding (TypeRepMap f) = toEncoding f



-- instance ToJSON (TypeRepMap f)
-- instance FromJSON (TypeRepMap f)


-- Can start with:
-- instance FromJSON (TypeRepMap Identity)



-- DMap approach

-- data MortDummy = MortDummy {foo :: Double}

-- data KPCDummy = KPCDummy | NoKPCDummy