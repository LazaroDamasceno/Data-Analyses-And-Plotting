from numpy import log2

def adequated_number_bins(n_items):
    return 1 + log2(n_items)