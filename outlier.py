def is_outlier(q1_q3, number):
    q1 = q1_q3[0.25]
    q3 = q1_q3[0.75]
    iqr = q3 - q1
    lower_limit = q1 - 1.5*iqr
    upper_limit = q3 + 1.5*iqr
    return number < lower_limit or number > upper_limit