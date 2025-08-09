import numpy as np
import matplotlib.pyplot as plt

def q2_30_hex_to_float(hex_value):
    int_value = int(hex_value, 16)
    if int_value & (1 << 31):
        int_value -= (1 << 32)
    return int_value / (2**30)

value = []
with open("Output.txt", "r") as file:
    for line in file:
        hex_str = line.strip()
        if not hex_str:  # skip empty lines
            continue
        value.append(q2_30_hex_to_float(hex_str))

value = np.array(value, dtype=float)

print(f"Loaded {len(value)} samples.")

plt.figure(figsize=(10, 4))
plt.plot(range(len(value)), value)
plt.xlabel("Sample Index")
plt.ylabel("Amplitude")
plt.title("Q2.30 Data from Input.txt")
plt.grid(True)
plt.show()
