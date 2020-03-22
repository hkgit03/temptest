[
 This is for demonstrating procedures and generally testing things.

 procedures:
 1: MAIN -> ?, return to 0
 2: FAC (returns)
 3: PRINTNUM (returns)
 4: PRINTFAC -> FAC, return to PRINTFAC1
 5: PRINTFAC1 -> PRINTNUM, return to PRINTFAC2
 6: PRINTFAC2 (returns)

 TODO:
 - Use user input as argument to FAC
 - Try out arbitrary precision arithmetic
]


+ call MAIN
[

 1 MAIN [->+>+<<]>[-<+>] +>-[[-]<->]< [-
  set return to 0 (exit) <[-]>
  call PRINTFAC ++++>
 ]<

 4 PRINTFAC [->+>+<<]>[-<+>] +>----[[-]<->]< [-
  Print a number and its faculty
  {?} _0_
  >+++++ arg for FAC (number to factorize)
  Set as argument for printing and function call [->>>>+<<<<<+>]
  {?} {arg} _0_ 0 0 0 {arg}
  print stuff +++[->++++[->+++++++>+++<<]<]>>.[----<+++++>]<-.---.>>----.<<
              "The "  {?} {arg} 0 _101_ 0 32 {arg}
	      +.-----.++.+++++++++++++++++.-----.+++.---------.--------.+++++++++++.>>.<<
              "factorial "  {?} {arg} 0 _108_ 0 32 {arg}
	      +++.---------.>>.>
	      "of "  {?} {arg} 0 102 0 32 _{arg}_
	      print arg >>++++++++++<<[->+>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>>[-]>>>++++++++++<[->-[>+>>]>[+[-<+>]>+>>]<<<<<]>[-]>>[>++++++[-<++++++++>]<.<<+>+>[-]]<[<[->-<]++++++[->++++++++<]>.[-]]<<++++++[-<++++++++>]<.[-]<<[-]<
	                {?} {arg} 0 102 0 32 _0_
              <.<<+++.++++++++++.>>.
              " is "  {?} {arg} 0 115 0 _32_
	      [-]<<[-]<<
  {?} _{arg}_
  set return address to PRINTFAC1 <[-]+++++>
  {PRINTFAC1} _{arg}_
  call FAC >++>
  {PRINTFAC1} {arg} {FAC} _0_
 ]<

 5 PRINTFAC1 [->+>+<<]>[-<+>] +>-----[[-]<->]< [-
  Print a number and its faculty (part 2)
  {return address} {arg} ? _0_
  set arg as argument to PRINTNUM <[-]<[->+<]
  {return address} _0_ {arg}
  set return address to PRINTFAC2 ++++++
  {return address} _{PRINTFAC2}_ {arg}
  call PRINTNUM >>+++>
  {return address} {PRINTFAC2} {arg} {PRINTNUM} _0_
 ]<

 6 PRINTFAC2 [->+>+<<]>[-<+>] +>------[[-]<->]< [-
  Print a number and its faculty (part 3)
  {return address} ?
  ".\n" <[-]+++++[->+++++++++<]>+.--[----<+>]<-.[-]
  {return address} _0_
 ]<

 2 FAC [->+>+<<]>[-<+>] +>--[[-]<->]< [-
  calculate the faculty of ARG
  {arg} {?} _0_
  >+<<<[[->>+<<]>>>-<<<]>>[-<<+>>] set flag: 'arg was 0'
  {arg} {?} _0_ {flag}
  +<<[
   - we can already decrement arg at this point
   _{arg dec}_ {?} x
   [->>>+>>+<<<<<]>>>[-<<<+>>>]
   {arg dec} {?} x _0_ 0 {arg dec}
   <[->+>+<<]>[-<+>]
   {arg dec} {?} x _0_ x {arg dec}
   >>[-<[-<+<+>>]<[->+<]>>]<[-]<<<<
   _{arg dec}_ {?} y
  ]>>
  0 {?} _{result}_ {flag?}
  >[[-]<[-]>]< if arg was 0 the result must be 0 as well
  set return address <[-]<<[->+<]
  _0_ {ret addr} 0 {result}
  set result as argument >>>[-<<<+>>>]<
  {result} {ret addr} _0_
 ]<

 3 PRINTNUM [->+>+<<]>[-<+>] +>---[[-]<->]< [-
  print ARG as a decimal number
  {return address} {arg} ? _0_
  print arg <[-]>++++++++++<<[->+>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>>[-]>>>++++++++++<[->-[>+>>]>[+[-<+>]>+>>]<<<<<]>[-]>>[>++++++[-<++++++++>]<.<<+>+>[-]]<[<[->-<]++++++[->++++++++<]>.[-]]<<++++++[-<++++++++>]<.[-]<<[-]<
  {return address} _0_
 ]<

]