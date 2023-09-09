'''ASH - args operations'''

from sys import argv

@value
struct ArgV:
    '''Iterable arg vector.'''
    var data: VariadicList[StringRef]
    var size: Int
    var index: Int

    fn __init__(inout self):
        self.data = argv()
        self.size = len(self.data)
        self.index = 0

    fn __len__(self) -> Int:
        return self.size - self.index

    fn __next__(inout self) -> StringRef:
        let result = self.data[self.index]
        self.index += 1
        return result

    fn __iter__(inout self) -> ArgV:
        self.index = 0
        return self