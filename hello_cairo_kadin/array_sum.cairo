%builtins output

from starkware.cairo.common.alloc import alloc

# Computes the sum of the memory elements at addresses:
#   arr + 0, arr + 1, ..., arr + (size - 1).
func array_sum(arr, size) -> (sum):
    if size == 0:
        return (sum=0)
    end

    # size is not zero.
    let (sum_of_rest) = array_sum(arr=arr + 1, size=size - 1)
    return (sum=[arr] + sum_of_rest)
end

func even_array_product(arr, size) -> (product):
    if size == 0:
        return (product=1)
    end

    # size is not zero 
    let (product_of_rest) = even_array_product(arr=arr + 2, size=size - 2)
    return (product=[arr] * product_of_rest)
end

func main(output_ptr) -> (output_ptr):
    const ARRAY_SIZE = 4

    # Allocate an array.
    let (ptr) = alloc()

    # Populate some values in the array.
    assert [ptr] = 9
    assert [ptr + 1] = 16
    assert [ptr + 2] = 25
    assert [ptr + 3] = 3

    # Call array_sum to compute the sum of the elements.
    let (sum) = even_array_product(arr=ptr, size=ARRAY_SIZE)

    # Write the sum to the program output.
    assert [output_ptr] = sum

    # Return the new output pointer, which points to the end of
    # the program output.
    return (output_ptr=output_ptr + 1)
end




