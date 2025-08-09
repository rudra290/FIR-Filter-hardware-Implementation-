import numpy as np
import matplotlib.pyplot as plt

def float_to_q2_30_hex(value):
    # Scale to Q2.30
    scaled_value = int(np.round(value * (2**30)))
    
    # Saturate if needed
    if scaled_value < -2**31:
        scaled_value = -2**31
    elif scaled_value > 2**31 - 1:
        scaled_value = 2**31 - 1

    # Convert to zero-padded hex string
    return f"0x{(scaled_value & 0xFFFFFFFF):08X}"

frequency = []
sample_frequency = int(input("Enter The sample frequency : "))

while True:
    freq = int(input("Enter the frequency component (0 to stop): "))
    if freq == 0:
        break;
    elif freq > (sample_frequency/2):
        print("Frequency can't be greater Than Half of Sample Frequency\n")
        continue;

    frequency.append(freq)

print(frequency)


# Time axis for 10 cycles of lowest freq (500 Hz)
time = np.arange(0, 10*(1/min(frequency)), 0.1/sample_frequency)

#Sum of signals
x = 0
for i in range(np.size(frequency)):
    x = x + np.sin(2*np.pi*frequency[i]*time)


# Normalize to [-1, 1]
x_normal = x / np.max(np.abs(x))

# Convert to hex Q2.30
hex_value = np.zeros(np.size(x_normal), dtype=object)
for i in range(np.size(x_normal)):
    hex_value[i] = float_to_q2_30_hex(x_normal[i])
print(hex_value)
with open("Input.txt", "w") as file:
    print("Value printed!",file=file)
    for val in hex_value:
        print(val, file=file)

#Plot
plt.plot(time, x_normal)
plt.show()
