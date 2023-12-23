from num2words import num2words
import itertools

count = int(input("Введите количество сотрудников:"))
distancia = list(map(int, input("Введите расстояния от работы до домов сотрудников (через пробел): ").split()))
tarif = list(map(int, input("Введите тарифы за проезд одного километра в такси (через пробел): ").split()))

min_stoimost = float('inf')
min_taxi = []
for p in itertools.ps(range(count)):
    total_stoimost=0
    org=[]
    for i in range(count):
        taxi = p[i]
        stoimost = distancia[i] * tarif[taxi]
        total_stoimost += stoimost
        org.append(taxi + 1)
    if total_stoimost < min_stoimost:
        min_stoimost = total_stoimost
        min_taxi = org

def convert(summa):
    if summa < 1 or summa > 100000:
        return "Сумма должна быть от 1 до 100 000"
    words = num2words(summa, lang='ru')
    last_z = summa % 10
    if last_z == 1 and summa % 100 != 11:
        valuta = "рубль"
    elif 2 <= last_z <= 4 and (summa % 100 < 10 or summa % 100 >= 20):
        valuta = "рубля"
    else:
        valuta = "рублей"
    result = words.capitalize() + " " + valuta
    return result
    
result = convert(min_stoimost)
print(*min_taxi)
print(min_stoimost)
print(result)