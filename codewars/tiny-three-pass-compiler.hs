-- https://www.codewars.com/kata/tiny-three-pass-compiler

{-# LANGUAGE NamedFieldPuns #-}

module TinyThreePassCompiler where

import Data.List (elemIndex)
import Data.Maybe (fromJust)
import Text.Parsec
import Text.Parsec.Expr
import Text.Parsec.Language
import qualified Text.Parsec.Token as Token

data AST =
  Imm Int |
  Arg Int |
  Add AST AST |
  Sub AST AST |
  Mul AST AST |
  Div AST AST |
  Var String
  deriving (Eq, Show)

---

pass1 :: String -> AST
pass1 = uncurry pvs . pf

pvs vs (Var v) = Arg . fromJust $ elemIndex v vs
pvs vs (Add x y) = Add (pvs vs x) (pvs vs y)
pvs vs (Sub x y) = Sub (pvs vs x) (pvs vs y)
pvs vs (Mul x y) = Mul (pvs vs x) (pvs vs y)
pvs vs (Div x y) = Div (pvs vs x) (pvs vs y)
pvs _ t = t

pf = either undefined id <$> parse function []

function = (,) <$> arguments <*> expression

arguments = brackets $ many identifier

expression = buildExpressionParser table term

table = [[binaryl "*" Mul, binaryl "/" Div], [binaryl "+" Add, binaryl "-" Sub]]

binaryl s f = Infix (f <$ reservedOp s) AssocLeft

term = (Imm . fromInteger <$> integer) <|> (Var <$> identifier) <|> parens expression

Token.TokenParser {
  Token.parens,
  Token.integer,
  Token.brackets,
  Token.identifier,
  Token.reservedOp
} = Token.makeTokenParser $ emptyDef {
  Token.commentLine = "#",
  Token.reservedOpNames = ["*", "/", "+", "-"]
}

---

pass2 :: AST -> AST
pass2 = reduce

reduce (Add x y) = reduce1 $ Add (reduce x) (reduce y)
reduce (Sub x y) = reduce1 $ Sub (reduce x) (reduce y)
reduce (Mul x y) = reduce1 $ Mul (reduce x) (reduce y)
reduce (Div x y) = reduce1 $ Div (reduce x) (reduce y)
reduce t = t

reduce1 (Add (Imm x) (Imm y)) = Imm $ x + y
reduce1 (Sub (Imm x) (Imm y)) = Imm $ x - y
reduce1 (Mul (Imm x) (Imm y)) = Imm $ x * y
reduce1 (Div (Imm x) (Imm y)) = Imm $ div x y
reduce1 t = t

---

pass3 :: AST -> [String]
pass3 = map show <$> gen

data Instruction =
  IM Int |
  AR Int |
  SW | PU | PO |
  AD | SU | MU | DI
  deriving (Eq, Show)

gen (Imm x) = [IM x]
gen (Arg x) = [AR x]
gen (Add x y) = genOp AD x y
gen (Sub x y) = genOp SU x y
gen (Mul x y) = genOp MU x y
gen (Div x y) = genOp DI x y

genOp op x y = gen x ++ [PU] ++ gen y ++ [SW, PO, op]

---

compile :: String -> [String]
compile = pass3 . pass2 . pass1
