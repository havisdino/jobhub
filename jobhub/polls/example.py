class dcm:
    sum = 0
    stt =0
    power = 10
    def __init__(self,name):
        dcm.sum += 1
        self.stt = dcm.sum
        self.name = name
    def xinchao(self):
        print("xin chao",self.name)
    @classmethod
    def update_power(cls):
        cls.power = 5
    
    def update_single(self):
        self.power = 20
a = dcm("tung dz")
print(a.name)
print(a.stt)
a.xinchao()
a.update_power()
print(dcm.power)
print(a.power)

a.update_single()
print(dcm.power)
print(a.power)
print(a.__dict__)

class sieunhan:
    power = 10
class sieunhangao(sieunhan):
    def __init__(self,name):
        self.name = name
a = sieunhangao("tung dz")
print(a.power)