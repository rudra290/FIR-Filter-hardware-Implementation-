import numpy as np

def q2_30_to_q4_28_multiply_corrected(hex_a, hex_b):
    """
    Multiplies two Q2.30 fixed-point numbers and returns the result in Q4.28 format.
    """
    def hex_to_signed_32(h):
        """Convert hex string to signed 32-bit integer."""
        val = int(h, 16)
        if val & (1 << 31):
            val -= 1 << 32
        return val

    def signed_32_to_hex(v):
        """Convert signed 32-bit integer to a 32-bit two's complement hex string."""
        # Mask with 0xFFFFFFFF to get the correct 32-bit two's complement representation
        return hex(v & 0xFFFFFFFF)

    # Convert inputs from hex strings to their integer representations
    # 'a' represents the float value_a * 2^30
    # 'b' represents the float value_b * 2^30
    a = hex_to_signed_32(hex_a)
    b = hex_to_signed_32(hex_b)

    # Multiply the integers. The product is now in Q4.60 format.
    # product represents (value_a * value_b) * 2^60
    product = a * b

    # Shift right by 32 bits to convert Q4.60 -> Q4.28 format
    # Now, result represents (value_a * value_b) * 2^28
    result = product >> 32

    # Convert result to hex string and floating-point number
    result_hex = signed_32_to_hex(result)
    # To get the final float, divide by the new scaling factor (2^28)
    result_float = result / (1 << 28)

    return result_hex, result_float

# Example usage:
# hex_a (0x80000000) is -2.0 in Q2.30 format.
# hex_b (0x7FFFFFFF) is ≈2.0 in Q2.30 format.
# The expected result is ≈ -4.0.

res_hex, res_float = q2_30_to_q4_28_multiply_corrected("0x80000000", "0x7FFFFFFF")
print(f"Hex: {res_hex}, Float: {res_float}")

# Expected Output: Hex: 0xc0000000, Float: -4.0