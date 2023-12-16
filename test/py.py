# def max_product_subarray(nums):
#     if not nums:
#         return 0

#     max_product = nums[0]
#     min_product = nums[0]
#     result = max_product

#     for i in range(1, len(nums)):
#         if nums[i] < 0:
#             max_product, min_product = min_product, max_product

#         max_product = max(nums[i], max_product * nums[i])
#         min_product = min(nums[i], min_product * nums[i])

#         result = max(result, max_product)

#     return result
def max_subarray_sum(nums):
    if not nums:
        return 0

    max_sum = current_sum = nums[0]

    for num in nums[1:]:
        current_sum = max(num, current_sum + num)
        max_sum = max(max_sum, current_sum)

    return max_sum


# Example usage:
nums = [1, -2, 3,0,-3,9,4,7]
result = max_subarray_sum(nums)
print(result)

# def max_product_subarray(nums):
#     if not nums:
#         return 0

#     max_product = nums[0]
#     min_product = nums[0]
#     result = max_product

#     for i in range(1, len(nums)):
#         if nums[i] < 0:
#             max_product, min_product = min_product, max_product

#         max_product = max(nums[i], max_product * nums[i])
#         min_product = min(nums[i], min_product * nums[i])

#         result = max(result, max_product)

#     return result

# Example usage:
# nums = [2, 3, -2, 4, -1]
# result = max_product_subarray(nums)
# print(result)
# Example usage:
# nums = [2, 1, -3, 9, -1, 2, 1, -5, -4]
# nums =[1,2,3,0,-3,9,4,7]
# result = max_product_subarray(nums)
# print(result)
