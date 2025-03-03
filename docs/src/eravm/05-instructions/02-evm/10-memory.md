# Memory



## MLOAD

Original [EVM](https://www.evm.codes/#51?fork=shanghai) instruction.

Heap memory load operation is modeled with a native EraVM instruction.

### LLVM IR

```llvm
%value = load i256, ptr addrspace(1) %pointer, align 1
```

[LLVM IR instruction documentation](https://releases.llvm.org/15.0.0/docs/LangRef.html#load-instruction)

### EraVM Assembly

```asm
ld.1    r1, r2
```

See [EraVM instruction: `st.1`](https://matter-labs.github.io/eravm-spec/spec.html#LoadDefinition)



## MSTORE

Original [EVM](https://www.evm.codes/#52?fork=shanghai) instruction.

Heap memory load operation is modeled with a native EraVM instruction.

### LLVM IR

```llvm
store i256 128, ptr addrspace(1) inttoptr (i256 64 to ptr addrspace(1)), align 1
```

[LLVM IR instruction documentation](https://releases.llvm.org/15.0.0/docs/LangRef.html#store-instruction)

### EraVM Assembly

```asm
st.1    r1, r2
```

See [EraVM instruction: `st.1`](https://matter-labs.github.io/eravm-spec/spec.html#StoreDefinition)



## MSTORE8

Original [EVM](https://www.evm.codes/#53?fork=shanghai) instruction.

### LLVM IR

```llvm
define void @__mstore8(i256 addrspace(1)* nocapture nofree noundef dereferenceable(32) %addr, i256 %val) #2 {
entry:
  %orig_value = load i256, i256 addrspace(1)* %addr, align 1
  %orig_value_shifted_left = shl i256 %orig_value, 8
  %orig_value_shifted_right = lshr i256 %orig_value_shifted_left, 8
  %byte_value_shifted = shl i256 %val, 248
  %store_result = or i256 %orig_value_shifted_right, %byte_value_shifted
  store i256 %store_result, i256 addrspace(1)* %addr, align 1
  ret void
}
```
