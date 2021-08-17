# factorial using functions only

def countdown(n:int) -> list:
    return list(range(n, 0, -1))

def product_list(xs:list):
    if not xs:
        return 1
    else:
        return xs[0] * product_list(xs[1:])

def factorial(n:int):
    return product_list(countdown(n))


# def count_from1(x):
#     out = []
#     def count(fromint):
#         if fromint == x:
#             out.append(x)
#         else:
#             out.append(fromint)
#             count(fromint+1)

#     return count(1)

