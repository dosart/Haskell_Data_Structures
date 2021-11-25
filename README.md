# Haskell data structures

The project was made as part of the [Coding Interview University](https://github.com/Ilyushin/google-interview-university) course, and learning Haskell programming language. 

## Dependencies
- stack (build tool for Haskell )
- make

## SimpleList

- [x] implements the Functor, Applicative, Monad type classes
- [x] addItem  - inserts the item into the SimpleList
- [x] removeItem  - removes the item  from the SimpleList
- [x] size - returns the list's size
- [x] head - returns the first item of the list
- [x] tail - returns all elements except the first
- [x] concat - concatenates the list of lists
- [x] fromList - converts the List to the SimpleList 
- [x] toList - converts the SimpleList to the List
- [x] replicate - repeats number n time 
- [x] take - returns n first items of the list
- [x] zip - zipping SimpleLists
- [x] map - takes a function and a SimpleList and applies that function to every element in the SimpleList
- [x] filter - returns a Simple constructed from members of a SimpleList (the second argument) fulfilling a condition given by the first argument
- [x] folder - it takes the second argument and the SimpleList item of the SimpleList and applies the function, then it takes the penultimate item from the end and the result, and so on. See scanr for intermediate results. 

## BinaryTree

- [x] implements the Functor type classe
- [x] toList - converts the BinaryTree to the list
- [x] fromList - converts the list to the BinaryTree
- [x] treeMinimum - returns the minimum item of the list
- [x] treeMaximum - returns the maximum item of the list
- [x] treeSize - returns the tree's size
- [x] treeEmpty - returns true if tree is empty
- [x] treeDepth - returns the tree's depth
- [x] treeMap - takes a function and a tree and applies that function to every element in the tree
- [x] treeFolds - folds tree to one element
