# Сглаживание списка
a_list = [[1, 2], [3, 4], [5, 6]]
print(list(itertools.chain.from_iterable(a_list)))
# Вывод: [1, 2, 3, 4, 5, 6]
