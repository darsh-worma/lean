#eval 2 + 2

-- 1.1 - evaluating shit
-- function arguments are passed without (), use spaces
#eval String.append "Hello, " "Lean!"
#eval String.append "it is " (if 1 > 2 then "true" else "false")
#eval 42 + 19 -- 61
#eval String.append "A" (String.append "B" "C") -- ABC
#eval String.append (String.append "A" "B") "C" -- ABC
#eval if 3 == 3 then 5 else 7 -- 5
#eval if 3 == 4 then "equal" else "≠" -- ≠
