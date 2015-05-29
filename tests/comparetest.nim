import unittest, compare

suite "Version compare":
  test "Compare 1 to 2 and return -1 to show 1 is less than 2":
    check compare("1", "2") == -1

  test "Compare 2 to 1 and return 1 to show 2 is greater than 1":
    check compare("2", "1") == 1

  test "Compare 1 to 1 and return 0 to show 1 is equal to 1":
    check compare("1", "1") == 0

  test "Compare 1.1 to 1.2 and return -1 to show 1.1 is less than 1.2":
    check compare("1.1", "1.2") == -1

  test "Compare 1.3 to 1.2 and return 1 to show 1.3 is greater than 1.2":
    check compare("1.3", "1.2") == 1

  test "Compare 1.1 to 1.1 and return 0 to show 1.1 is equal to 1.1":
    check compare("1.1", "1.1") == 0

  test "Compare 1.1.1 to 1.1 and return 1 to show 1.1.1 is greater than to 1.1":
    check compare("1.1.1", "1.1") == 1

  test "Compare 1.1.1 to 1.1.2 and return -1 to show 1.1.1 is less than 1.1.2":
    check compare("1.1.1", "1.1.2") == -1

  test "Compare 1.1.3 to 1.1.2 and return 1 to show 1.1.3 is greater than 1.1.2":
    check compare("1.1.3", "1.1.2") == 1

  test "Compare 1.1.1 to 1.1.1 and return 0 to show 1.1.1 is equal to 1.1.1":
    check compare("1.1.1", "1.1.1") == 0

  test "Compare 1.1.1-beta to 1.1.1 and return -1 to show 1.1.1-beta is less than 1.1.1":
    check compare("1.1.1-beta", "1.1.1") == -1

  test "Compare 1.1.1 to 1.1.1-beta and return 1 to show 1.1.1 is greater than 1.1.1-beta":
    check compare("1.1.1", "1.1.1-beta") == 1

  test "Compare 1.1.1-beta to 1.1.1-beta and return 0 to show 1.1.1-beta is equal to 1.1.1-beta":
    check compare("1.1.1-beta", "1.1.1-beta") == 0

  test "Compare 1.1.1-b to 1.1.1-beta and return 0 to show 1.1.1-b is equal to 1.1.1-beta":
    check compare("1.1.1-b", "1.1.1-beta") == 0

  test "Compare 1.1.1-beta to 1.1.1-beta2 and return -1 to show 1.1.1-beta is less than 1.1.1-beta2":
    check compare("1.1.1-beta", "1.1.1-beta2") == -1

  test "Compare 1.1.1-beta2 to 1.1.1-beta and return 1 to show 1.1.1-beta2 is greater than 1.1.1-beta":
    check compare("1.1.1-beta2", "1.1.1-beta") == 1

  test "Compare 1.1.1-beta to 1.1.1-beta and return 0 to show 1.1.1-beta is equal to 1.1.1-beta":
    check compare("1.1.1-beta", "1.1.1-beta") == 0

  test "Compare 1.1.1-b3 to 1.1.1-b3 and return 0 to show 1.1.1-b3 is equal to 1.1.1-b3":
    check compare("1.1.1-b3", "1.1.1-b3") == 0

  test "Compare 1.1.1-beta to 1.1.1-rc and return -1 to show 1.1.1-beta is less than 1.1.1-rc":
    check compare("1.1.1-beta", "1.1.1-rc") == -1

  test "Compare 1.1.1-rc to 1.1.1-beta and return 1 to show 1.1.1-rc is greater than 1.1.1-beta":
    check compare("1.1.1-rc", "1.1.1-beta") == 1

  test "Compare 1.1.1-RC to 1.1.1-BETA and return 1 to show 1.1.1-RC is greater than 1.1.1-BETA":
    check compare("1.1.1-RC", "1.1.1-BETA") == 1

  test "Compare 1.1.1-rc to 1.1.1-rc and return 0 to show 1.1.1-rc is equal to 1.1.1-rc":
    check compare("1.1.1-rc", "1.1.1-rc") == 0
