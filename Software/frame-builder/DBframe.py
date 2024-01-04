################################################################
# DBframe.py
# Dev: Rr42@GitHub
# File version: v1.0
# Python version: 3.8.10 (Linux)
# Description:
#   Custom classes to facilitate logic, pixel, and frame
#  operations easier.
################################################################
from __future__ import annotations
from dataclasses import dataclass
from typing import List, Union, Literal, Final

# Define logic levels
HIGH: Final[Literal[True]] = True
LOW: Final[Literal[False]] = False

# Define logic
@dataclass
class Logic:
    value: bool = LOW

    # Enforce datatypes
    #  __annotations and dataclasses.fields based solutions
    #  will not work properly if annotations is imported from __future__
    def __post_init__(self) -> None:
        if not isinstance(self.value, bool):
            # Attempt a type conversion
            try:
                self.value = bool(self.value)
            except ValueError:
                # Raise an error if a type mismatch if found
                raise ValueError(f'Expected value to be bool, got {repr(self.value)}')

    # Overloading unary operator(s)
    #  All this for reimplementing ~ operator of bool
    def __invert__(self) -> Logic:
        '''Implements unary NOT (~) operation for the Pixel class'''
        if self.value == LOW:
            return Logic(HIGH)
        else:
            return Logic(LOW)

    # Overloading binary operator(s)
    def __or__(self, other: Union[Logic, bool]) -> Logic:
        '''Implements binary OR (|) operation for the Logic class'''
        if isinstance(other, Logic):
            return Logic(self.value|other.value)
        else:
            return Logic(self.value|other)

    def __and__(self, other: Union[Logic, bool]) -> Logic:
        '''Implements binary AND (&) operation for the Logic class'''
        if isinstance(other, Logic):
            return Logic(self.value&other.value)
        else:
            return Logic(self.value&other)

    def __xor__(self, other: Union[Logic, bool]) -> Logic:
        '''Implements binary XOR (^) operation for the Logic class'''
        if isinstance(other, Logic):
            return Logic(self.value^other.value)
        else:
            return Logic(self.value^other)

    # Overloading comparison operator(s)
    def __lt__(self, other: Union[Logic, bool]) -> bool:
        '''Implements assignment less than (<) operation for the Logic class'''
        if isinstance(other, Logic):
            return self.value<other.value
        else:
            return self.value<other

    def __gt__(self, other: Union[Logic, bool]) -> bool:
        '''Implements assignment grater than (>) operation for the Logic class'''
        if isinstance(other, Logic):
            return self.value>other.value
        else:
            return self.value>other

    def __le__(self, other: Union[Logic, bool]) -> bool:
        '''Implements assignment less than or equal (<=) operation for the Logic class'''
        if isinstance(other, Logic):
            return self.value<=other.value
        else:
            return self.value<=other

    def __ge__(self, other: Union[Logic, bool]) -> bool:
        '''Implements assignment grater than or equal (>=) operation for the Logic class'''
        if isinstance(other, Logic):
            return self.value>=other.value
        else:
            return self.value>=other

    def __eq__(self, other: Union[Logic, bool]) -> bool:
        '''Implements assignment equal (==) operation for the Logic class'''
        if isinstance(other, Logic):
            return self.value==other.value
        else:
            return self.value==other

    def __ne__(self, other: Union[Logic, bool]) -> bool:
        '''Implements assignment not equal (!=) operation for the Logic class'''
        if isinstance(other, Logic):
            return self.value!=other.value
        else:
            return self.value!=other

    # Overloading assignment operator(s)
    def __ior__(self, other: Union[Logic, bool]) -> Logic:
        '''Implements assignment OR (|=) operation for the Logic class'''
        if isinstance(other, Logic):
            self.value |= other.value
        else:
            self.value |= other
        return self

    def __iand__(self, other: Union[Logic, bool]) -> Logic:
        '''Implements assignment AND (&=) operation for the Logic class'''
        if isinstance(other, Logic):
            self.value &= other.value
        else:
            self.value &= other
        return self

    def __ixor__(self, other: Union[Logic, bool]) -> Logic:
        '''Implements assignment XOR (^=) operation for the Logic class'''
        if isinstance(other, Logic):
            self.value ^= other.value
        else:
            self.value ^= other
        return self

    # Overloading other operation(s)
    def __getitem__(self, other) -> bool:
        '''Implements subscript operation for the Logic class'''
        return self.value

    def __str__(self) -> str:
        '''Implements string conversion of Logic class'''
        return str(self.value)

# Define a pixel
@dataclass
class Pixel:
    r: Logic = Logic(LOW)
    g: Logic = Logic(LOW)
    b: Logic = Logic(LOW)

    # Enforce datatypes
    #  __annotations and dataclasses.fields based solutions
    #  will not work properly if annotations is imported from __future__
    def __post_init__(self) -> None:
        # Check type for r
        if not isinstance(self.r, Logic):
            # Attempt a type conversion
            try:
                self.r = Logic(self.r)
            except ValueError:
                # Raise an error if a type mismatch if found
                raise ValueError(f'Expected r to be Logic, got {repr(self.r)}')
        # Check type for g
        if not isinstance(self.g, Logic):
            # Attempt a type conversion
            try:
                self.g = Logic(self.g)
            except ValueError:
                # Raise an error if a type mismatch if found
                raise ValueError(f'Expected g to be Logic, got {repr(self.g)}')
        # Check type for b
        if not isinstance(self.b, Logic):
            # Attempt a type conversion
            try:
                self.b = Logic(self.b)
            except ValueError:
                # Raise an error if a type mismatch if found
                raise ValueError(f'Expected b to be Logic, got {repr(self.b)}')

    # Overloading unary operator(s)
    def __invert__(self) -> Pixel:
        '''Implements unary NOT (~) operation for the Pixel class'''
        return Pixel(~self.r, ~self.g, ~self.b)

    # Overloading binary operator(s)
    def __or__(self, other: Pixel) -> Pixel:
        '''Implements binary OR (|) operation for the Pixel class'''
        return Pixel(self.r|other.r, self.g|other.g, self.b|other.b)

    def __and__(self, other: Pixel) -> Pixel:
        '''Implements binary AND (&) operation for the Pixel class'''
        return Pixel(self.r&other.r, self.g&other.g, self.b&other.b)

    def __xor__(self, other: Pixel) -> Pixel:
        '''Implements binary XOR (^) operation for the Pixel class'''
        return Pixel(self.r^other.r, self.g^other.g, self.b^other.b)

    # Overloading assignment operator(s)
    def __ior__(self, other: Pixel) -> Pixel:
        '''Implements assignment OR (|=) operation for the Pixel class'''
        self.r |= other.r
        self.g |= other.g
        self.b |= other.b
        return self

    def __iand__(self, other: Pixel) -> Pixel:
        '''Implements assignment AND (&=) operation for the Pixel class'''
        self.r &= other.r
        self.g &= other.g
        self.b &= other.b
        return self

    def __ixor__(self, other: Pixel) -> Pixel:
        '''Implements assignment XOR (^=) operation for the Pixel class'''
        self.r ^= other.r
        self.g ^= other.g
        self.b ^= other.b
        return self

    # Overloading other operation(s)
    def __setattr__(self, __name: str, __value: Union[Logic, bool]) -> None:
        '''Implements set attribute operation for the Frame class'''
        if isinstance(__value, Logic):
            self.__dict__[__name] = __value
        else:
            self.__dict__[__name] = Logic(__value)

    def __str__(self) -> str:
        '''Implements string conversion of Pixel class'''
        return f"Pixel(r={self.r}, g={self.g}, b={self.b})"

# Define a frame type
frame_t = List[List[Pixel]]

# Define a frame
@dataclass
class Frame:
    _frame: frame_t
    _Nrow: int
    _Ncol: int

    # Define initializer
    def __init__(self, Nrow: int = 0, Ncol: int = 0) -> None:
        '''Initializer to create an empty rectangular frame of given dimensions'''
        self.frame = [[Pixel() for col in range(Ncol)] for row in range(Nrow)]

    # Define properties
    @property
    def Nrow(self) -> int:
        return self._Nrow

    @property
    def Ncol(self) -> int:
        return self._Ncol

    @property
    def frame(self) -> frame_t:
        return self._frame

    @frame.setter
    def frame(self, new_frame: frame_t) -> None:
        # Enforce datatype
        if type(new_frame) != list:
            raise ValueError(f"Argument new_frame needs of be of type frame_t (List[List[Pixel]]) not {repr(new_frame)}")
        self._frame = new_frame
        # Store number of rows
        self._Nrow = len(self._frame)
        # Store max row length
        if self._frame:
            self._Ncol = max((len(row) for row in self._frame))
        else:
            self._Ncol = 0

    # Define static members
    @staticmethod
    def convert(list_frame: frame_t) -> Frame:
        '''Static method of Frame class to convert frame_t type to Frame class type'''
        # Create new empty frame of Frame class type
        new_frame: Frame = Frame()
        # Populate new frame
        new_frame.frame = list_frame
        return new_frame

    # Methods for frame transformations
    def transpose(self) -> Frame:
        '''Implements the matrix transpose operation to the frame'''
        # Create a temporary new frame of [self.Ncol, self.Nrow]
        new_frame: Frame = Frame(self.Ncol, self.Nrow)
        # Populate rows of the new frame with the column data and vice versa
        for row_index in range(self.Ncol):
            for col_index in range(self.Nrow):
                #  Don't use the setter to let the assignment execute a little faster
                new_frame._frame[row_index][col_index] = self[col_index][row_index]
        # Replace the current frame with the newly created frame
        self.frame = new_frame._frame
        return self

    # Overloading unary operator(s)
    def __invert__(self) -> Frame:
        '''Implements unary NOT (~) operation for the Frame class'''
        return self.convert([[~pixel for pixel in row] for row in self.frame])

    # Overloading binary operator(s)
    def __or__(self, other: Frame) -> Frame:
        '''Implements binary OR (|) operation for the Frame class'''
        # If the frame dimensions don't match raise an error
        if not (self.Nrow == other.Nrow and self.Ncol == other.Ncol):
            raise ValueError(f"Cannot perform binary OR (|) on frames with mismatched dimensions!")
        return self.convert([[pixel|other[row_index][pixel_index] for pixel_index, pixel in enumerate(row)] for row_index, row in enumerate(self.frame)])

    def __and__(self, other: Frame) -> Frame:
        '''Implements binary AND (&) operation for the Frame class'''
        # If the frame dimensions don't match raise an error
        if not (self.Nrow == other.Nrow and self.Ncol == other.Ncol):
            raise ValueError(f"Cannot perform binary AND (&) on frames with mismatched dimensions!")
        return self.convert([[pixel&other[row_index][pixel_index] for pixel_index, pixel in enumerate(row)] for row_index, row in enumerate(self.frame)])

    def __xor__(self, other: Frame) -> Frame:
        '''Implements binary XOR (^) operation for the Frame class'''
        # If the frame dimensions don't match raise an error
        if not (self.Nrow == other.Nrow and self.Ncol == other.Ncol):
            raise ValueError(f"Cannot perform binary XOR (^) on frames with mismatched dimensions!")
        return self.convert([[pixel^other[row_index][pixel_index] for pixel_index, pixel in enumerate(row)] for row_index, row in enumerate(self.frame)])

    # Overloading assignment operator(s)
    def __ior__(self, other: Frame) -> Frame:
        '''Implements assignment OR (|=) operation for the Frame class'''
        # If the frame dimensions don't match raise an error
        if not (self.Nrow == other.Nrow and self.Ncol == other.Ncol):
            raise ValueError(f"Cannot perform assignment OR (|=) on frames with mismatched dimensions!")
        # Compute and save in self
        #  Use the overloaded binary OR (|) operator
        self.frame = (self|other).frame
        return self

    def __iand__(self, other: Frame) -> Frame:
        '''Implements assignment AND (&=) operation for the Frame class'''
        # If the frame dimensions don't match raise an error
        if not (self.Nrow == other.Nrow and self.Ncol == other.Ncol):
            raise ValueError(f"Cannot perform assignment AND (&=) on frames with mismatched dimensions!")
        # Compute and save in self
        #  Use the overloaded binary AND ($) operator
        self.frame = (self&other).frame
        return self

    def __ixor__(self, other: Frame) -> Frame:
        '''Implements assignment XOR (^=) operation for the Frame class'''
        # If the frame dimensions don't match raise an error
        if not (self.Nrow == other.Nrow and self.Ncol == other.Ncol):
            raise ValueError(f"Cannot perform assignment XOR (^=) on frames with mismatched dimensions!")
        # Compute and save in self
        #  Use the overloaded binary XOR (^) operator
        self.frame = (self^other).frame
        return self

    # Overloading other operation(s)
    def __getitem__(self, index: int) -> List[Pixel]:
        '''Implements subscript ([]) operation for the Frame class'''
        return self.frame[index]

    def __str__(self) -> str:
        '''Implements string conversion of Frame class'''
        output: str = f"[{self.Nrow}][{self.Ncol}]\n"
        for row in self.frame:
            for px in row[:-1]:
                output += f"{px} | "
            output += f"{row[-1]}\n"
        return output

if __name__ == "__main__":
    # Examples for Logic class
    print("Printing examples for Logic class...")
    print(f"{isinstance(True, Logic)=}", end="\n\n")
    print(f"{True^Logic(True).value=}", f"{Logic(True)^True=}", end="\n\n")
    print(f"{Logic(True)<Logic(False)=}", end="\n\n")
    print(f"{Logic(True)>Logic(False)=}", end="\n\n")
    print(f"{Logic(True)==Logic(False)=}", end="\n\n")
    print(f"{Logic(False)==False=}", end="\n\n")
    print(f"{Logic(True)!=Logic(False)=}", end="\n\n")

    # Examples for Pixel class
    print("Printing examples for Pixel class...")
    p1: Pixel = Pixel(1, 0, 1) # type: ignore
    p2: Pixel = Pixel(1, 1, 1) # type: ignore
    print(f"{p1&p2=}", end="\n\n")
    print(f"{p1|p2=}", end="\n\n")
    print(f"{~p2=}", end="\n\n")
    p2,p1 = p1,p2
    print(f"{p2=}", f"{p1=}", end="\n\n")

    # Examples for Frame class
    print("Printing examples for Frame class...")
    f1: Frame = Frame()
    f2: Frame = Frame(2, 3)
    f3: Frame = Frame(2, 3)
    print(f"{f1=}", end="\n\n")
    print(f"{f2=}", end="\n\n")
    f2[0][0].g=True # type: ignore
    f3[0][0].g=True # type: ignore
    f3[1][2].g=True # type: ignore
    f3[1][1].b=True # type: ignore
    f3[1][0].r=True # type: ignore
    print(f"{type(f2[0][0].g)=}", end="\n\n")
    print(f"{f3=}", end="\n\n")
    print(f"{f2=}", end="\n\n")
    ft: frame_t = [[Pixel()]]
    # f2.frame = f1 # Raises a ValueError
    print(f"{type(f1)=}", end="\n\n")
    print(f"{Frame.convert(ft)=}", end="\n\n")
    print(f"~f2={~f2}", end="\n\n")
    print(f"f2^f3={f2^f3}", end="\n\n")
    print(f"f2|f3={f2|f3}", end="\n\n")
    f1 = f3
    f1 |= f2
    print(f"f1={f1}", end="\n\n")
    print(f"f2={str(f2)}", end="\n\n")
    f1.transpose()
    print(f"transpose(f1)={f1}")
