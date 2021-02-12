## copmutes the product of all the even array entries 


func even_array_product(arr, size) -> (product):
    if size == 0:
        return (product=0)
    end

    # size is not zero 
    let (product_of_rest) = even_array_product(arr=arr + 2, size=size - 2)
    return (product=[arr] * product_of_rest)
end

