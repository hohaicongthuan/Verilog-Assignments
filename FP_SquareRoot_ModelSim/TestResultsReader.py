# From: https://stackoverflow.com/questions/8751653/how-to-convert-a-binary-string-into-a-float-value
from codecs import decode
import struct
import math

def bin_to_float(b):
    """ Convert binary string to a float. """
    bf = int_to_bytes(int(b, 2), 8)  # 8 bytes needed for IEEE 754 binary64.
    return struct.unpack('>d', bf)[0]

def int_to_bytes(n, length):  # Helper function
    """ Int/long to byte string.

        Python 3.2+ has a built-in int.to_bytes() method that could be used
        instead, but the following works in earlier versions including 2.x.
    """
    return decode('%%0%dx' % (length << 1) % n, 'hex')[-length:]

def float_to_bin(value):  # For testing.
    """ Convert float to 32-bit binary string. """
    [d] = struct.unpack(">Q", struct.pack(">d", value))
    return '{:064b}'.format(d)
###############################################################################################
###############################################################################################
# My own code starts here
# This code will read, check and convert test results into human-readable form

f = open("TestResults.txt", "r")
x = 0.0
AverageError = 0.0
NumOfTest = 0

for i in f:
    x = round(x + 1.0, 10)

    print("Test Number x =\t\t\t", x)
    print("Square root of x =\t\t", math.sqrt(x))
    Sign    = i[:1]
    Exp     = bin(int(i[1:9], 2) - 127 + 1023).replace("0b", "").zfill(11)
    Mant    = i[9:32] + "00000000000000000000000000000"
    Num     = Sign + Exp + Mant
    print("Result from FP_SQRT:\t", bin_to_float(Num))
    print("Error:\t\t\t\t\t", abs(math.sqrt(x) - bin_to_float(Num)))
    print("")

    NumOfTest = NumOfTest + 1
    AverageError = AverageError + abs(math.sqrt(x) - bin_to_float(Num))

print("Average Error:\t", AverageError / NumOfTest)

f.close()