'''Arg Stream Helper (ASH)'''

from sys import argv

@value
struct ArgV:
    '''Iterable arg vector.'''
    var data: VariadicList[StringRef]
    var size: Int
    var index: Int

    fn __init__(inout self, args: VariadicList[StringRef]):
        self.data = args
        self.size = len(args)
        self.index = 0

    fn __len__(self) -> Int:
        return self.size - self.index

    fn __next__(inout self) raises -> StringRef:
        if self.index < self.size:
            let result = self.data[self.index]
            self.index += 1
            return result
        else:
            raise Error("End of iteration")

    fn __iter__(inout self) -> ArgV:
        self.index = 0
        return self