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

-- 1.2 - types
-- Nat is the type for natural numbers
#eval (1 - 2 : Nat) -- evals to 0
-- Int is for integers
#eval (1 - 2 : Int) -- evals to -1
#check (1 - 2 : Nat) -- returns 1 - 2 : Nat. even without specifying Nat, we get Nat. so it's probably good to use Int.


-- 1.3 - functions
-- 1.3.1 - defining functions
-- use def keyword
def hello := "Hello"
#eval String.append hello " world"
def add1 (n : Nat) : Nat := n + 1
-- def fn_name (param1 : type1) (param2 : type2) : return_type := function
#eval add1 4 -- returns 5

def max_fn (a : Nat) (b : Nat) : Nat :=
    if a < b then
        b
    else a

#eval max_fn 300 100 -- returns 300, there's also a built in max function

-- normally, Lean returns the function signature when used with #check
-- but we can put the function name in parentheses as follows
#check add1 -- returns add1 (n : Nat) : Nat
#check (add1) -- returns add1 : Nat → Nat
#check (max_fn)

def joinStringsWith (a : String) (b : String) (c : String) : String :=
    String.append b (String.append a c)

#eval joinStringsWith ", " "one" "and another"
#check joinStringsWith ": "

def volume (h : Nat) (w : Nat) (d : Nat) : Nat := h * w * d
#check (volume)


-- 1.3.2 types type shit
-- can rename types like this
def Str : Type := String
def abc : Str := "this is a string, imma call myself abc"

#eval abc


abbrev N : Type := Nat
def five : N := 5

#eval five
