[-]> clear final number (just for clarity)

get char ,
raw char to digit (decrement 48 times) >++++++++[-<------>]<
{number} {arg} _0_

while last arg was digit +[-

{number} {arg} _0_
copy arg <[->>+>+<<<]>>[-<<+>>]
{number} {arg} _0_ {arg} 0
decrement at most 9 times +++++++++[-> [-[->+<]]>[-<+>]< <]
FLAG 'is digit' +>[[-]<->]<
{number} {arg} _{'is digit'}_

Multiply number by 10 and add arg
[-
 {number} {arg} _0_
 >>++++++++++[-
  {number} {arg} 0 0 n
  <<<<[->>+>+<<<]>>[-<<+>>]
  {number} {arg} 0 _{number}_ n
 ]
 <[->+>+<<]>[-<+>]
 {number} {arg} _0_ {arg}
]

[[->+<]
 {arg} _0_ {'is digit'} 0 ({multiplied arg})
 FIXME: Use arg/replace final number by number
 Multiply existing number by 10 
 {arg} 10 {'is digit'} 0 _{number}_ {final number}
 TODO: Add to number
]