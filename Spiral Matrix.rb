# @return {Integer[]}
def spiral_order(matrix)
    return [] if matrix.empty?
    return matrix[0] if matrix.size == 1
    
    result = []
    # set top, left, bottom, right
    top, bottom = 0, matrix.length
    left, right = 0, matrix[0].length
    
    # iterate until the left/right or top/bottom intersect
    while left < right && top < bottom
        # grab the first row (from left to right)
        (left..right-1).each { |i| result << matrix[top][i] }
        top += 1
        
        # grab the last column (from top to bottom)
        (top..bottom-1).each { |i| result << matrix[i][right-1] }
        right -= 1
        
        # check for breaking out
        break unless left < right && top < bottom
        
        # grab the bottom row (from right to left)
        (right-1).downto(left).each { |i| result << matrix[bottom-1][i] }
        bottom -= 1
        
        # grab the first column (from bottom to top)
        (bottom-1).downto(top).each { |i| result << matrix[i][left] }
        left += 1
    end
    
    return result
end