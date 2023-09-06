require "byebug"

# exponent recursion 1
def exponent(b, n)
    return 1 if n == 0
    b * exponent(b, n-1)
end

# p exponent(2, 0)
# p exponent(2, 1)
# p exponent(2, 2)
# p exponent(2, 3)

# exponent recursion 2
def exp(b, n)
    return 1 if n == 0
    return b if n == 1
    if n.even? 
        return exp(b, n/2) ** 2
    else
        return (b * exp(b, (n-1)/2) ** 2)
    end
end

# p exp(2, 0)
# p exp(2, 1)
# p exp(2, 2)
# p exp(2, 3)
# p exp(2, 4)
# p exp(2, 5)


# deep dup
class Array
    def deep_dup
        #return [self] if !self.is_a?(Array)

        new_arr = []
        self.each do |el|
            if el.is_a?(Array)
                new_arr << el.deep_dup
            else
                new_arr << el
            end
        end
        new_arr
    end
end

# a = [1, [2], [3, [4]]]
# p a.object_id
# p a
# b = a.deep_dup
# p b.object_id
# p b

def fibonacci_rec(n)
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2
    arr = fibonacci_rec(n-1)
    arr << arr[-1]+arr[-2]
end

# p fibonacci_rec(0)
# p fibonacci_rec(1)
# p fibonacci_rec(2)
# p fibonacci_rec(3)
# p fibonacci_rec(4)
# p fibonacci_rec(5)
# p fibonacci_rec(6)
# p fibonacci_rec(7)
# p fibonacci_rec(8)
# p fibonacci_rec(9)

def fibonacci_iter(n)
    arr = []
    num = 0
    (0...n).each do |i|
        if i == 0 || i == 1
            num = 1
        else
            num = arr[i-1] + arr[i-2]
        end
        arr << num
    end
    return arr
end

# p fibonacci_iter(0)
# p fibonacci_iter(1)
# p fibonacci_iter(2)
# p fibonacci_iter(3)
# p fibonacci_iter(4)
# p fibonacci_iter(5)
# p fibonacci_iter(6)
# p fibonacci_iter(7)
# p fibonacci_iter(8)
# p fibonacci_iter(9)

def bsearch(arr, target)
    return nil if arr.length == 1 && target != arr[0]

    mid = arr.length/2
    if arr[mid] == target
        return mid
    elsif arr[mid] == nil
        return nil
    elsif arr[mid] > target # search lower half
        return_value = bsearch(arr[0...mid], target)
        if return_value == nil
            return nil
        else 
            return return_value
        end
    elsif arr[mid] < target # search higher half
        return_value = bsearch(arr[mid+1..-1], target)
        if return_value == nil
            return nil
        else 
            return mid + 1 + return_value
        end
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil



