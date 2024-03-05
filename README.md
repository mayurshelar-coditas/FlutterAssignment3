1. 
Given an integer array nums sorted in non-decreasing order, return an 
array of the squares of each number sorted in non-decreasing order.
 
Example 1:
Input: nums = [-4,-1,0,3,10]
Output: [0,1,9,16,100]
Explanation: After squaring, the array becomes [16,1,0,9,100].
After sorting, it becomes [0,1,9,16,100].

Example 2:
Input: nums = [-7,-3,2,3,11]
Output: [4,9,9,49,121]

========================================================================

2. 

Given an array of integers nums and an integer target, return indices of 
the two numbers such that they add up to target.
You may assume that each input would have exactly one solution, and you 
may not use the same element twice.
You can return the answer in any order.
 
Example 1:
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

Example 2:
Input: nums = [3,2,4], target = 6
Output: [1,2]

Example 3:
Input: nums = [3,3], target = 6
Output: [0,1]

========================================================================

3. 
Write a function to find the longest common prefix string amongst an 
array of strings.
If there is no common prefix, return an empty string "".
 
Example 1:
Input: strs = ["flower","flow","flight"]
Output: "fl"

Example 2:
Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.

========================================================================

4. 
Given a string s, find the length of the longest
substring
without repeating characters.
 
Example 1:
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.

Example 2:
Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.

Example 3:
Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and 
not a substring.

========================================================================

5.
Given two integer arrays nums1 and nums2, return an array of their 
intersection. Each element in the result must appear as many times as it 
shows in both arrays and you may return the result in any order.
 
Example 1:
Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2,2]

Example 2:
Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [4,9]
Explanation: [9,4] is also accepted.
========================================================================

6.
Given two strings s and t, return true if t is an anagram of s, and false 
otherwise.
An Anagram is a word or phrase formed by rearranging the letters of a 
different word or phrase, typically using all the original letters 
exactly once.
 
Example 1:
Input: s = "anagram", t = "nagaram"
Output: true

Example 2:
Input: s = "rat", t = "car"
Output: false
========================================================================

7. 
Implement Inorder, preorder and postorder traversal of tree. 
Use the below class to construct your tree data structure.
/**
* Definition for a binary tree node.
* class TreeNode {
*   int val;
*   TreeNode? left;
*   TreeNode? right;
*   TreeNode([this.val = 0, this.left, this.right]);
* }
*/
========================================================================

8. 
Roman numerals are represented by seven different symbols: I, V, X, L, C, 
D and M.
Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
For example, 2 is written as II in Roman numeral, just two one's added 
together. 12 is written as XII, which is simply X + II. The number 27 is 
written as XXVII, which is XX + V + II.
Roman numerals are usually written largest to smallest from left to 
right. However, the numeral for four is not IIII. Instead, the number 
four is written as IV. Because the one is before the five we subtract it 
making four. The same principle applies to the number nine, which is 
written as IX. There are six instances where subtraction is used:
I can be placed before V (5) and X (10) to make 4 and 9. 
X can be placed before L (50) and C (100) to make 40 and 90. 
C can be placed before D (500) and M (1000) to make 400 and 900.
Given an integer, convert it to a roman numeral.
 
Example 1:
Input: num = 3
Output: "III"
Explanation: 3 is represented as 3 ones.

Example 2:
Input: num = 58
Output: "LVIII"
Explanation: L = 50, V = 5, III = 3.

Example 3:
Input: num = 1994
Output: "MCMXCIV"
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
========================================================================

9.
 Given an input string s, reverse the order of the words.
A word is defined as a sequence of non-space characters. The words in s 
will be separated by at least one space.
Return a string of the words in reverse order concatenated by a single 
space.
Note that s may contain leading or trailing spaces or multiple spaces 
between two words. The returned string should only have a single space 
separating the words. Do not include any extra spaces.
 
Example 1:
Input: s = "the sky is blue"
Output: "blue is sky the"

Example 2:
Input: s = "  hello world  "
Output: "world hello"
Explanation: Your reversed string should not contain leading or trailing 
spaces.

Example 3:
Input: s = "a good   example"
Output: "example good a"
Explanation: You need to reduce multiple spaces between two words to a 
single space in the reversed string.
========================================================================

10.
Given a string s, remove duplicate letters so that every letter appears 
once and only once. You must make sure your result is
the smallest in lexicographical order
among all possible results.
 
Example 1:
Input: s = "bcabc"
Output: "abc"

Example 2:
Input: s = "cbacdcbc"
Output: "acdb"

========================================================================
 
 
 
 
 
 

# 
FlutterAssignment3
