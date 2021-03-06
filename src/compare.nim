import strutils, re

# TODO docblock
proc compareNumbers(vOne: int, vTwo: int): int =
  if vOne > vTwo:
    return 1
  elif vOne == vTwo:
    return 0
  return -1

proc prepareNumber(number: string): int =
  let
    chars = {'B','b','r','R'}
    found = number.find(chars)
  if found == -1:
    return number.parseInt
  let
    numberPattern = re("\\d+")
    foundNumber = number.findAll(numberPattern)
  var returnVal = 0
  if number[0].toLower == 'b':
    returnVal = -99999
  elif number[0].toLower == 'r':
    returnVal = -88888
  if len(foundNumber) != 0:
    let vNum = foundNumber[0].parseInt
    returnVal += vNum
  return returnVal

proc compare*(vOne: string, vTwo: string): int =
  let
    vOneParts = vOne.split({'.','-'})
    vTwoParts = vTwo.split({'.','-'})
    oneNumOfParts = len(vOneParts)
    twoNumOfParts = len(vTwoParts)
    max = oneNumOfParts-1
  for i in countup(0, max):
    let numOne = prepareNumber(vOneParts[i])
    if i >= twoNumOfParts:
      if numOne < 0:
        return -1
      elif numOne > 0:
        return 1
      return 0
    let
      numTwo = prepareNumber(vTwoParts[i])
      compared = compareNumbers(numOne, numTwo)
    if compared != 0:
      return compared
  if twoNumOfParts > oneNumOfParts:
    let num = prepareNumber(vTwoParts[twoNumOfParts-1])
    if num < 0:
      return 1
    elif num > 0:
      return -1
    return 0
  return 0
