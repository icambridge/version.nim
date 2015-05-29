import strutils

proc compare*(vOne: string, vTwo: string): int =
  let vOneParts = vOne.split(".")
  let vTwoParts = vTwo.split(".")
  
  let vOneInt = vOneParts[0].parseInt
  let vTwoInt = vTwoParts[0].parseInt

  if vOneInt > vTwoInt:
    return 1
  elif vOneInt == vTwoInt:
    return 0

  return -1
