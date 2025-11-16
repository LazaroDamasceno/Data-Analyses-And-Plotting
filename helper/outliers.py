
def is_outlier(q1, q3, number):

    iqr = q3 - q1
    lower_limit = q1 - 1.5*iqr
    upper_limit = q3 + 1.5*iqr

    if (number < lower_limit or number > upper_limit):
        return True
    else:
        return False