import numpy as np

def float_to_q2_30_hex(value):
    scaled_value = int(np.round(value * (2**30)))
    
    if scaled_value < -2**31:
        scaled_value = -2**31
    elif scaled_value > 2**31 - 1:
        scaled_value = 2**31 - 1

    return f"0x{(scaled_value & 0xFFFFFFFF):08X}"

coeffi = []
with open(r"C:\Users\rudra\Documents\Coefficient_float.txt", "r") as file:
    for line in file:
        str_coeffi = line.strip()
        if str_coeffi: 
            float_val = float(str_coeffi)
            coeffi.append(float_to_q2_30_hex(float_val))

with open(r"c:\Users\rudra\OneDrive\Desktop\FIR_Filter Project\FIR-Filter-hardware-Implementation-\FIR_Filter\FIR_Filter.sim\sim_1\behav\xsim\Coefficient.txt", "w") as file:
    for val in coeffi:
        print(val, file=file)