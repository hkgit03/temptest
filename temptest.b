[
 This is for demonstrating procedures and generally testing things.

 procedures:
 1: MAIN -> ?, return to 0
 2: FAC (returns)
 3: PRINTNUM (currently unused)
 4: PRINTFAC -> FAC, return to PRINTFAC1
 5: PRINTFAC1 (returns)

 TODO:
 - Make PRINTFAC call PRINTNUM for the result and then print the period
 - Use user input as argument to FAC
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
  >+++++ number to factorize
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
  call fac >++>
  {PRINTFAC1} {arg} {fac} _0_
 ]<

 5 PRINTFAC1 [->+>+<<]>[-<+>] +>-----[[-]<->]< [-
  Print a number and its faculty (part 2)
  {return address} {FAC result} {?} _0_
  print result <[-]>++++++++++<<[->+>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>>[-]>>>++++++++++<[->-[>+>>]>[+[-<+>]>+>>]<<<<<]>[-]>>[>++++++[-<++++++++>]<.<<+>+>[-]]<[<[->-<]++++++[->++++++++<]>.[-]]<<++++++[-<++++++++>]<.[-]<<[-]
  {return address} 0 _0_
  ".\n" +++++[-<+++++++++>]<+.--[---->+<]>-.[-]<
  {return address} _0_
 ]<

 2 fac [->+>+<<]>[-<+>] +>--[[-]<->]< [-
  calculate the faculty of ARG
  {arg} {?} _0_
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
  0 {?} _{result}_
  set return address <[-]<<[->+<]
  _0_ {ret addr} 0 {result}
  set result as argument >>>[-<<<+>>>]<
  {result} {ret addr} _0_
 ]<

 3 PRINTNUM [->+>+<<]>[-<+>] +>---[[-]<->]< [-
  print ARG as a decimal number
  print arg <[-]>++++++++++<<[->+>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>>[-]>>>++++++++++<[->-[>+>>]>[+[-<+>]>+>>]<<<<<]>[-]>>[>++++++[-<++++++++>]<.<<+>+>[-]]<[<[->-<]++++++[->++++++++<]>.[-]]<<++++++[-<++++++++>]<.[-]<<[-<+>]<[-]
  call EXIT [-]>
 ]<

]