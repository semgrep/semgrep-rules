module FloatingPointMoney where

# ruleid: haskell_lang_floating_point_money
data Txn = Txn { txnAmount :: Double, currency :: Text }

# ruleid: haskell_lang_floating_point_money
  , refundAmount :: Maybe Float

# ruleid: haskell_lang_floating_point_money
computeFee :: Double -> Double

# ok: haskell_lang_floating_point_money
data Txn = Txn { txnAmount :: Scientific }

# ok: haskell_lang_floating_point_money
amountPaise :: Int64

# ok: haskell_lang_floating_point_money
latency :: Double

# ok: haskell_lang_floating_point_money
syncRefundInterval :: Double
