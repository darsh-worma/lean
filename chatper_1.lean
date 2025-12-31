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

-- 1.4 structures
#check 1.2
#check (0 : Float)

-- defining structs
structure Point where
    x : Float
    y : Float

def origin : Point := { x := 0.0, y := 0.0 }
#eval origin
#eval origin.x -- returns 0.000000
#eval origin.y + 2 -- returns 2.000000

def addPoints (p1 : Point) (p2 : Point) : Point :=
    {x := p1.x + p2.x, y := p1.y + p2.y}

#eval addPoints {x := 1, y := 2} {x := 1, y := 2}

def distance (p1 : Point) (p2 : Point) : Float :=
    Float.sqrt ( ((p2.x - p1.x) ^ 2) + ((p2.y - p1.y) ^ 2))

#eval distance {x := 51, y := 2} {x := 1, y := 2}

-- with keyword omg functional programming mentioned!
def zeroX (p : Point) : Point := { p with x := 0}
-- instead of
-- def zeroX (p : Point) : point := {x := 0, y := p.y}
-- the former is better for maintenance and apparently this what functional programming is about. i'll explain more later at some point hopefully.

def fourAndThree : Point := { x := 4, y := 3}
#eval fourAndThree -- returns { x := 4.000000, y := 3.000000 }
#eval zeroX fourAndThree -- returns { x := 0.000000, y := 3.000000 }
#eval fourAndThree -- returns { x := 4.000000, y := 3.000000 }
-- note how calling zeroX on fourAndThree doesn't change the original x value

-- Point.mk represents the constructor name
#check (Point.mk) -- returns Point.mk : Float → Float → Point
-- we can override a structure's constructor name as follows
-- structure Point where
--     point ::
--     x : Float
--     y : Float
-- this makes Point.point point to Point.mk (the verb point is like c pointer not like cartesian point)
#check (Point.x)

-- 1.4.3 exercises
structure RectangularPrism where
    h : Float
    w : Float
    d : Float

def rp_volume (rp : RectangularPrism) : Float := rp.h * rp.w * rp.d
#eval rp_volume {h := 2, w := 2, d := 3}

structure segment where
    p1 : Point
    p2 : Point

def length (s : segment) : Float := distance s.p1 s.p2
def point1 : Point := { x := 1.1234, y := 3.32}
def point2 : Point := { x := 0.2, y  := 4.5}
def seg : segment := { p1 := point1, p2 := point2}
#eval length seg

-- names introduced by RectangularPrism are
-- RectangularPrism
-- RectangularPrism.mk
-- RectangularPrism.h
-- RectangularPrism.w
-- RectangularPrism.d

-- names introduced by Hamster are
-- Hamster
-- Hamster.mk
-- Hamster.name
-- Hamster.fluffy

-- names introduced by Book are
-- Book
-- Book.mk, Book.makeBook
-- Book.title
-- Book.author
-- Book.price
