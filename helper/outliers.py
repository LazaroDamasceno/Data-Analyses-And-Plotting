
def is_outlier(q1: int, q3: int, number: int) -> bool:
    iqr = q3 - q1
    lower_limit = q1 - 1.5*iqr
    upper_limit = q3 + 1.5*iqr
    return number < lower_limit or number > upper_limit