import 'dart:collection';
import 'dart:math';
import 'tree_node.dart';
import 'merge_sort.dart';

void main() {
  //Question 1.
  List<int> numbersArray = [-4, -1, 0, 3, 10];
  squareAndSortArray(numbersArray);
  print(numbersArray); //Output - [0, 1, 9, 16, 100]

  //Question 2.
  twoSum([2, 7, 11, 15], 9); //Output - [0, 1]
  twoSum([3, 2, 4], 6); //Output - [1, 2]

  //Question 3.
  print(getLongestCommonPrefix(["flower", "flow", "flight"]));

  print(getLongestCommonPrefix(["dog", "racecar", "car"]));

  //Question 4.
  print(lengthOfLongestSubstring("abcabcbb")); //Output - 3
  print(lengthOfLongestSubstring("bbbbb")); //Output - 1
  print(lengthOfLongestSubstring("pwwkew")); //Output - 3

  //Question 5.
  print(getIntersection([2, 2], [1, 2, 2, 1]));
  print(getIntersection([4, 9, 5], [9, 4, 9, 8, 4]));

  //Question 6.
  print(isAnagram("anagram", "nagaram")); //Output - true
  print(isAnagram("rat", "car")); //Output - false
  print(isAnagram("Mayur", "ruyaM")); //Output - true.

  //Question 7.
  TreeNode head = TreeNode(1, TreeNode(2, TreeNode(3), TreeNode(4)),
      TreeNode(5, TreeNode(6), TreeNode(7)));
  inOrderTraversal(head);

  //Question 8.
  print(convertToRomanNumber(1994)); //Output - MCMXCIV.
  print(convertToRomanNumber(58)); //Output - LVIII.
  print(convertToRomanNumber(3)); //Output - III.

  //Question 9.
  print(reverseWordsInAString("the sky is blue")); //Output - "blue is sky the"
  print(reverseWordsInAString("  hello world  ")); //Output - "world hello"
  print(reverseWordsInAString("a good   example")); //Output - "example good a"

  //Question 10.
  print(removeDuplicateLetters("bcabc")); //Output - abc
  print(removeDuplicateLetters("cbacdcbc")); //Output - acdb
}

/* 1.
Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

Example 1:
Input: nums = [-4,-1,0,3,10]
Output: [0,1,9,16,100]
Explanation: After squaring, the array becomes [16,1,0,9,100].
After sorting, it becomes [0,1,9,16,100].

Example 2:
Input: nums = [-7,-3,2,3,11]
Output: [4,9,9,49,121] 

Appraoch.
First I'll traverse the array, using a loop, to make the changes inplace and then make use of sort() function to return the
array in non-decreasing order
      
Solution -      */

void squareAndSortArray(List<int> numbersArray) {
  for (int number = 0; number < numbersArray.length; number++) {
    numbersArray[number] = numbersArray[number] * numbersArray[number];
  }
  mergeSort(numbersArray, 0, numbersArray.length - 1);
}

// ========================================================================

/* 2.

Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
You may assume that each input would have exactly one solution, and you may not use the same element twice.
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

Approach - First I'll sort the array/List in ascending order and then follow a two-pointer approach and do the following for the following cases: (i = 0, j = nums.length-1);
if nums[i] + nums[j] == target return nums[i] and nums[j]
if nums[i] + nums[j] < target then I'll increment i; as the sum is falling short
if nums[i] + nums[j] > target then I'll increment j; as sum is exceding the target.
And to maintain the original indices I'll map them. 

Solution - */

void twoSum(List<int> numbersArray, int target) {
  int firstPointer = 0, secondPointer = numbersArray.length - 1;

  final Map<int, int> indicesAndElements = new HashMap();

  for (int number = 0; number < numbersArray.length; number++) {
    indicesAndElements.addAll({numbersArray[number]: number});
  }

  mergeSort(numbersArray, 0, numbersArray.length - 1);
  while (firstPointer != secondPointer) {
    int currentSum = numbersArray[firstPointer] + numbersArray[secondPointer];
    if (currentSum == target) {
      print("First Index: ${indicesAndElements[numbersArray[firstPointer]]}");
      print("Second Index: ${indicesAndElements[numbersArray[secondPointer]]}");
      return;
    } else if (currentSum > target) {
      if (numbersArray[firstPointer] >= numbersArray[secondPointer]) {
        firstPointer++;
      } else {
        secondPointer--;
      }
    } else {
      if (numbersArray[firstPointer] <= numbersArray[secondPointer]) {
        firstPointer++;
      } else {
        secondPointer--;
      }
    }
  }
}

// ========================================================================

/* 3.
Write a function to find the longest common prefix string amongst an array of strings.
If there is no common prefix, return an empty string "".

Example 1:
Input: strs = ["flower","flow","flight"]
Output: "fl"

Example 2:
Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.

Approach - First I will the sort the array, then I will compare first and last string of the array as both of them will have the least common prefix and if both of these have a common prefix then other string in the array will also have altleast a prefix that is common in both of these.

Solution - */
String getLongestCommonPrefix(List<String> array) {
  array.sort();

  StringBuffer prefix = StringBuffer();
  int currentChar = 0;
  while (currentChar < array[0].length &&
      array[0][currentChar] == array[array.length - 1][currentChar]) {
    prefix.write(array[0][currentChar++]);
  }

  return prefix.toString();
}

//=======================================================================
/* 4.
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
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.*/

//Solution -
int lengthOfLongestSubstring(String s) {
  Set<String> set = <String>{};
  int maxLength = 0;
  int left = 0;
  for (int right = 0; right < s.length; right++) {
    String currentChar = s[right];

    if (!set.contains(currentChar)) {
      set.add(currentChar);
      maxLength = max(maxLength, right - left + 1);
    } else {
      while (s[left] != currentChar) {
        set.remove(s[left]);
        left++;
      }
      set.remove(s[left]);
      left++;
      set.add(currentChar);
    }
  }
  return maxLength;
}

// ========================================================================
/* 5.
Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.

Example 1:
Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2,2]

Example 2:
Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [4,9]
Explanation: [9,4] is also accepted. */

List<int> getIntersection(List<int> firstList, List<int> secondList) {
  int firstListIterator = 0, secondListIterator = 0;
  List<int> intersectionSet = [];

  mergeSort(firstList, 0, firstList.length - 1);
  mergeSort(secondList, 0, secondList.length - 1);

  while (firstListIterator < firstList.length &&
      secondListIterator < secondList.length) {
    if (firstList[firstListIterator] == secondList[secondListIterator]) {
      intersectionSet.add(firstList[firstListIterator]);
      firstListIterator++;
      secondListIterator++;
    } else if (firstList[firstListIterator] > secondList[secondListIterator]) {
      secondListIterator++;
    } else {
      firstListIterator++;
    }
  }

  return intersectionSet;
}

// ========================================================================
/* 6.
Given two strings s and t, return true if t is an anagram of s, and false otherwise.
An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

Example 1:
Input: s = "anagram", t = "nagaram"
Output: true

Example 2:
Input: s = "rat", t = "car"
Output: false 

Approach - 1. First I'll check length of both is same or not, bcoz if length itself is not same anagram cannot be formed.
2. To individually count the frequency each letter and check if both the strings have same frequency count or not. */

bool isAnagram(String s, String t) {
  if (s.length == t.length) {
    /*1st Approach 
    
    Converting to lowercase to handle case sentivity.
    List<String> arrayOfStringS = s.toLowerCase().split("");
    List<String> arrayOfStringT = t.toLowerCase().split("");

    arrayOfStringS.sort();
    arrayOfStringT.sort();

    return arrayOfStringS.join("") == arrayOfStringT.join();
    
    */

    s = s.toLowerCase();
    t = t.toLowerCase();

    List<int> letterFrequencyForS = List.filled(26, 0);
    List<int> letterFrequencyForT = List.filled(26, 0);

    for (int character = 0; character < s.length; character++) {
      letterFrequencyForT[t.codeUnitAt(character) - 'a'.codeUnitAt(0)]++;
      letterFrequencyForS[s.codeUnitAt(character) - 'a'.codeUnitAt(0)]++;
    }

    for (int index = 0; index < 26; index++) {
      if (letterFrequencyForT[index] != letterFrequencyForS[index]) {
        return false;
      }
    }

    return true;
  }
  return false;
}

//========================================================================

/* 7. Implement Inorder, preorder and postorder traversal of tree.
      Use the below class to construct your tree data structure.
      Definition for a binary tree node. 
      
Solution - */

void inOrderTraversal(TreeNode? node) {
  if (node == null) {
    return;
  }

  inOrderTraversal(node.left);
  print(node.val);
  inOrderTraversal(node.right);
}

// ========================================================================
/* 8.
Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.
 Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle   applies to the number nine, which is written as IX. There are six instances where subtraction is used:
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
 Explanation: L = 50, V = 5, III = 3

 Example 3:
 Input: num = 1994
 Output: "MCMXCIV"
 Explanation: M = 1000, CM = 900, XC = 90 and IV = 4. 

 Approach - 1. In roman numbers the numerals are written from largest to smallest from left to right. so I will keep on the a symbol untl the number becomes smaller than the value represented by that symbol. There are 2 ways by which we can achieve this approach.

 Solution - */
String convertToRomanNumber(int number) {
  /* 
  First Approach.
  int countOfM = number ~/ 1000;
  while (countOfM > 0) {
    romanNumber.write('M');
    countOfM--;
  }
  number %= 1000;

  if (number >= 900) {
    romanNumber.write("CM");
    number -= 900;
  }

  if (number >= 500) {
    romanNumber.write('D');
  }

  int countOfC = number ~/ 100;

  while (countOfC > 0) {
    romanNumber.write("C");
    countOfC--;
  }

  number %= 100;

  if (number >= 90) {
    romanNumber.write("XC");
    number -= 90;
  }

  if (number >= 50) {
    romanNumber.write("L");
    number -= 50;
  }

  int countOfX = number ~/ 10;

  while (countOfX > 0) {
    romanNumber.write('X');
  }

  number %= 10;

  while (number >= 9) {
		s.append("IX");
		number -= 9;
	}
	while (number >= 5) {
		s.append("V");
		number -= 5;
	}
	while (number >= 4) {
		s.append("IV");
		number -= 4;
	}
	while (number >= 1) {
		s.append("I");
		number -= 1;
	}
  return romanNumber.toString();
  */

  StringBuffer romanNumber =
      StringBuffer(); //Using StringBuffer for better performance.

  final List<String> symbols = [
    "M",
    "CM",
    "D",
    "CD",
    "C",
    "XC",
    "L",
    "XL",
    "X",
    "IX",
    "V",
    "IV",
    "I"
  ];
  final List<int> values = [
    1000,
    900,
    500,
    400,
    100,
    90,
    50,
    40,
    10,
    9,
    5,
    4,
    1
  ];

  for (int mappingIndex = 0; mappingIndex < values.length; mappingIndex++) {
    while (number >= values[mappingIndex]) {
      romanNumber.write(symbols[mappingIndex]);
      number -= values[mappingIndex];
    }
  }

  return romanNumber.toString();
}

// ========================================================================

/* 9.
 Given an input string s, reverse the order of the words.
A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.
Return a string of the words in reverse order concatenated by a single space.
Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.

Example 1:
Input: s = "the sky is blue"
Output: "blue is sky the"

Example 2:
Input: s = "  hello world  "
Output: "world hello"
Explanation: Your reversed string should not contain leading or trailing spaces.

Example 3:
Input: s = "a good   example"
Output: "example good a"
Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.

Approach - 1. Convert the String of words into array of words. Then reverse that array and convert it to string of words again.
2. Use regular expression to remove extra spaces between the string.

Solution - */

String reverseWordsInAString(String words) {
  List<String> listOfWords = words.trim().split(" ");

  for (int word = 0; word < listOfWords.length / 2; word++) {
    String word1 = listOfWords[word];
    listOfWords[word] = listOfWords[listOfWords.length - word - 1];
    listOfWords[listOfWords.length - word - 1] = word1;
  }

  return listOfWords
      .join(" ")
      .replaceAll(RegExp(r'\s+'), ' '); //Handling extra spaces in the string.
}

// ========================================================================

/* 10.
Given a string s, remove duplicate letters so that every letter appears once and only once. You must make sure your result is
the smallest in lexicographical order
among all possible results.

Example 1:
Input: s = "bcabc"
Output: "abc"

Example 2:
Input: s = "cbacdcbc"
Output: "acdb"

Approach - 
1. I will track the last index of character presence.
2. Maintain a list to keep track of characters if I will used them once (seen) as we requires non-repeating characters.
3. Maintain a stack to perform operation and check if the string being produced is lexically shortest or not.
*/

String removeDuplicateLetters(String s) {
  List<int> lastIndex = List.filled(26, 0);
  for (int i = 0; i < s.length; i++) {
    lastIndex[s.codeUnitAt(i) - 'a'.codeUnitAt(0)] = i;
  }

  List<bool> seen = List.filled(26, false);
  List<int> stack = [];

  for (int i = 0; i < s.length; i++) {
    int currentCharacter = s.codeUnitAt(i) - 'a'.codeUnitAt(0);
    if (seen[currentCharacter])
      continue; // if seen continue as we need to pick one char only
    while (stack.isNotEmpty &&
        stack.last > currentCharacter &&
        i < lastIndex[stack.last]) {
      seen[stack.removeLast()] = false; // pop out and mark unseen
    }
    stack.add(currentCharacter); // add into stack
    seen[currentCharacter] = true; // mark seen
  }

  StringBuffer stringBuffer = StringBuffer();
  while (stack.isNotEmpty) {
    stringBuffer.writeCharCode(stack.removeLast() + 'a'.codeUnitAt(0));
  }
  return stringBuffer.toString().split('').reversed.join('');
}
// ========================================================================
