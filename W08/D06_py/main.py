from sys import argv
from math import pi, sqrt, pow
import itertools


# 01

def most_pop_words():
    words = []
    most_used_words = {}
    # very nice file handling XD ~kataya
    with open(argv[1], 'r') as data:

        for line in data:
            for word in line.split():
                words.append(word.lower().replace(".", ""))

    for word in set(words):
        most_used_words[word] = words.count(word)

    sorted_dict = dict(sorted(most_used_words.items(), key=lambda item: item[1], reverse=True))
    sliced_dict = dict(itertools.islice(sorted_dict.items(), 20))
    result = open('result.txt', 'w')
    for i in sliced_dict:
        result.write(f'{i} : {sliced_dict[i]} \n')
    result.close()


most_pop_words()


# 02

def distance(x1, y1, x2, y2):
    dis = sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2))
    print(dis)


# 03


class Vehicle0:
    pass


# 04

class Vehicle:

    def __init__(self, max_speed, mileage):
        self.max_speed = max_speed
        self.mileage = mileage


# 05

phrase = "Arafa Mohamed Ismael"


def reverse_phrases(given_phrase):
    words = given_phrase.split(" ")
    words = list(reversed(words))
    # nice, i can trust you with array and strings ~kataya
    print(" ".join(words))
    
    # you can also do it like this
def reverse_phrases_kataya(phrase):
    retrun " ".join(phrase.split()[::-1])


# reverse_phrases(phrase)

# 06


class input_manipulation:
    name = ""

    def get_string(self):
        self.name = input("Enter name please: \n")

    def print_string(self):
        print(self.name)


txt = input_manipulation()


# txt.get_string()
# txt.print_string()


# 07

class Circle:
    def __init__(self, radius):
        self.radius = radius

    def get_area(self):
        area = round(self.radius ** 2 * pi)
        print(f'Area of a circle with {self.radius} radius is {area}')

    def get_perimeter(self):
        perimeter = round(2 * pi * self.radius)
        print(f'Perimeter of a circle with {self.radius} radius is {perimeter}')


circ01 = Circle(10)
# circ01.get_area()
# Area of a circle with 10 radius is 314

# circ01.get_perimeter()
# Perimeter of a circle with 10 radius is 63
