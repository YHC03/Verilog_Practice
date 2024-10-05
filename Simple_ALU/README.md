# Simple ALU
간단한 ALU 구현  

---
## 설명
입력값은 A와 B, 출력값은 X와 Y이며, 모두 64bit 정수이다.  
명령은 3bit로 이루어져 있으며, 상세 명령어 목록은 다음과 같다.  

#### 상세 명령어 목록
|명령|설명|X의 값|Y의 값|
|---|---|---|---|
|000|No Operation.|A|B|
|001|Addition|A + B|0|
|010|Subtraction|A - B|0|
|011|Shift Left(Logical)|(A << B) \| (A >> (63 - B))|0|
|100|Shift Right(Logical)|(A >> B) \| (A << (63 - B))|0|
|101|AND|A & B|~(A & B)|
|110|OR|A | B|~(A | B)|
|111|XOR|A ^ B|~(A ^ B)|

---
작성자: YHC03  
최종 수정일: 2024/10/05  