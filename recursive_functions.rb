# This is merge sort done recursively
def merge_sort(arr,divided = []) 
    return arr if arr.length <= 1
    middle = arr.length/2
    merge( merge_sort(arr[0...middle]) , merge_sort(arr[middle..-1]) )
end

def merge arr_1, arr_2 
    sorted = []
    until(arr_1.empty? || arr_2.empty?)
        arr_1.first < arr_2.first ? sorted << arr_1.shift : sorted << arr_2.shift
    end
    sorted += arr_1 + arr_2
end


# This is merge sort done non-recursively. 
def merge_sort(arr) 
    n = arr.length/2 
    left_half = arr[0...n].sort 
    right_half = arr[n..-1].sort 
    left_index = 0 
    right_index = 0
    sorted = []
    loop do
        if left_half[left_index] == nil 
            sorted +=  right_half[right_index..-1]
            break
        elsif right_half[right_index] == nil
            sorted +=  left_half[left_index..-1]
            break
        elsif left_half[left_index] < right_half[right_index] 
            sorted << left_half[left_index]
            left_index += 1
        else
            sorted << right_half[right_index]
            right_index += 1
        end
    end
    sorted
end


#Define a functiion that accepts an array and number. The function then appends a digit to the end of the array starting from the provided digit all the way down to zero. 
# append([10],5)           #=> [10,5,4,3,2,10] 
# append([5],10)           #=> [5,10,9,8,7,6,5,4,3,2,1,0]
# append([10,9,8],7)       #=> [10,9,8,7,6,5,4,3,2,1,0]
def append(arr,n)  
    return arr << n  if n == 0
    arr << n 
    append(arr,n-1)
end


#Define a functiion that accepts an array and number. The function then appends a digit to the end of the array starting from the zero digit all the way up to the included digit.
# reverse_append([3],5)              #=> [3,0,1,2,3,4,5]
# reverse_append([7,8],4)            #=> [7,8,0,1,2,3,4]
# reverse_append([0,4,3],9)          #=> [0,4,3,0,1,2,3,4,5,6,7,8,9]
def reverse_append arr,n 
    return (arr << n).reverse if n == 0 || n < 0
    arr << n 
    reverse_append(arr,n-1)
end

# This is the above two methods but theyre extending the Array class instead of being standalone functions. 
# [1,2,3].append(4)             #=> [1,2,3,0,1,2,3,4]
# [0,3].append(6)               #=> [0,3,0,1,2,3,4,5,6]
# [2].reverse_append(4)         #=> [2,4,3,2,1]
# [10].reverse_append(9)        #=> [10,9,8,7,6,5,4,3,2,1,0]
class Array
    def append n 
        return self << n  if n == 0
        self << n 
        append(n-1)
    end

    def reverse_append n 
        return (self << n).reverse if n == 0 || n < 0
        self << n 
        reverse_append(n-1)
    end
end

# Define a recursive function that finds the factorial of a number.
# factorial(5)  #=> 120
# factorial(3)  #=> 6
def factorial n 
    if n <= 0
        1
    else
        n * factorial(n - 1)
    end
end

# Define a recursive function that returns true if a string is a palindrome and false otherwise.
# pal? "racecar"      #=> true
# pal? "programming"  #=> false
def pal? string
    if string.length == 1 || string.length == 0
        true
    elsif string[0] == string [-1]
        rec_pal?(string[1..-2])         
    else
        false
    end
end

# Define a recursive function that takes an argument n and prints "n bottles of beer on the wall", "(n-1) bottles of beer on the wall", ..., "no more bottles of beer on the wall".
def bottles n
    if n == 0 
        puts "no more bottles of beer on the wall"
    else 
        puts "#{n} bottles of beer on the wall, #{n} bottles of beer. Take one down, pass it around #{n-1} bottles of beer on the wall"
        bottles n-1
    end
end

# Define a recursive function that takes an argument n and returns the fibonacci value of that position. The fibonacci sequence is 0, 1, 1, 2, 3, 5, 8, 13, 21... So fib(5) should return 5, fib(6) should return 8.
def fib n
    if n == 0
        return 0
    elsif n == 1
        return 1
    else
        fib(n-1) + fib(n-2)
    end
end


# This is the fib sequence performed with iteration. 
def fib_loop n
    arr = [0,1]
    if n == 0
        return 0
    else
        (n-1).times do 
            arr << arr[-1] + arr[-2]
        end
    end
    arr[-1]
end


# Define a recursive function that flattens an array. 
# flatten [[1, 2], [3, 4]]           #=> [1, 2, 3, 4] 
# flatten [[1, [8, 9]], [3, 4]]    #=> [1, 8, 9, 3, 4].
def _flatten arr,result = []
    case arr[0].class.to_s
    when 'Array'
        _flatten(arr.shift, result)
        _flatten(arr, result ) unless arr.empty?
    when 'Integer'
        result <<  arr.shift
        _flatten(arr, result)
    end
    result
end


# A recursive function that finds the sum of the natural numbers below a given parameter. 
# factor(3,10) will return the sum of all the natural numbers that are multiples of three that are also less than 10. 
# List all the natural numbers below 10 that are multiples of 3. We get 3, 6 and 9. The sum of these multiples is 18.
# factor(3,10)        #=> 18
# factor(4,1000)   #=> 125500
def factor(number, ceiling, increment = 1)
    return 0 if (number * increment) > ceiling
    (number*increment) + factor(number, ceiling, increment + 1)
end
