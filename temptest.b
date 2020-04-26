[
 This is for demonstrating procedures and generally testing things.

 procedures:
 1: MAIN -> ?, return to 0
 2: PRINTFAC -> FAC, return to PRINTFAC1
 3: PRINTFAC1 -> PRINTNUM, return to PRINTFAC2
 4: PRINTFAC2 (returns)
 5: FAC (returns)
 6: PRINTNUM (returns)
 7: GETNUM (returns)

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

 2 PRINTFAC [->+>+<<]>[-<+>] +>--[[-]<->]< [-
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

 3 PRINTFAC1 [->+>+<<]>[-<+>] +>---[[-]<->]< [-
  Print a number and its faculty (part 2)
  {return address} {arg} ? _0_
  set arg as argument to PRINTNUM <[-]<[->+<]
  {return address} _0_ {arg}
  set return address to PRINTFAC2 ++++++
  {return address} _{PRINTFAC2}_ {arg}
  call PRINTNUM >>+++>
  {return address} {PRINTFAC2} {arg} {PRINTNUM} _0_
 ]<

 4 PRINTFAC2 [->+>+<<]>[-<+>] +>----[[-]<->]< [-
  Print a number and its faculty (part 3)
  {return address} ?
  ".\n" <[-]+++++[->+++++++++<]>+.--[----<+>]<-.[-]
  {return address} _0_
 ]<

 5 FAC [->+>+<<]>[-<+>] +>-----[[-]<->]< [-
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

 6 PRINTNUM [->+>+<<]>[-<+>] +>------[[-]<->]< [-
  print ARG as a decimal number
  {return address} {arg} ? _0_
  print arg <[-]>++++++++++<<[->+>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>>[-]>>>++++++++++<[->-[>+>>]>[+[-<+>]>+>>]<<<<<]>[-]>>[>++++++[-<++++++++>]<.<<+>+>[-]]<[<[->-<]++++++[->++++++++<]>.[-]]<<++++++[-<++++++++>]<.[-]<<[-]<
  {return address} _0_
 ]<

 7 GETNUM [->+>+<<]>[-<+>] +>-------[[-]<->]< [-
  {return address} ? _0_
  align return address for inserting argument later <[-]<[->+<]>>
  0 {return address} _0_
  
  {number} {return address} _0_
 ]<

]