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

    fn __str__(self) -> String:
        var result = String('{"') + self.data[0] + String('":')
        for i in range(self.size - 1):
            result += String(' "') + self.data[i+1] + String('",')
        return result[:-1] + String('}')

    fn show(inout self):
        print(self.__str__())
