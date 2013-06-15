import Data.List (intercalate)

-- vanilla version
convert '1' = '一'
convert '2' = '二'
convert '3' = '三'
convert '4' = '四'
convert '5' = '五'
convert '6' = '六'
convert '7' = '七'
convert '8' = '八'
convert '9' = '九'
convert '0' = '零'
convert '.' = '點'

numberToChinese = map convert

-- monadic dictionary lookup fail-safe version
dictionary = [
    ('1', '一'), ('2', '二'), ('3', '三'), ('4', '四'), ('5', '五'), 
    ('6', '六'), ('7', '七'), ('8', '八'), ('9', '九'), ('0', '零'), 
    ('.', '點')
    ]

numberToChinese' = mapM (flip lookup dictionary)

-- with positional notation
numerals = intercalate "千百十" (map (:[]) "極載澗溝壤梯京兆億萬")
numberToChinese'' input = expo' ++ frac
    where   converted = numberToChinese input
            (expo, frac) = break (== '點') converted
            expo' = concat $ zipWith mix expo numerals
            mix a b = [a, b]
