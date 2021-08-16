//
//  main.swift
//  Graph-Assignment-Repeating-Sequence
//
//  Created by Dylan Park on 2021-08-15.
//

import Foundation

/// base^exponent
/// - Parameters:
///   - base: the base
///   - exponent: the exponent (assume exponent >= 0)
/// - Returns: base^exponent
func power(base: Int, exponent: Int) -> Int {
  // base case
  if exponent == 0 { return 1 }
  // recursive case
  return base * power(base: base, exponent: exponent - 1)
}

func next(A: Int, P: Int) -> Int {
  return String(A)
    .compactMap { power(base: Int(String($0))!, exponent: P) }
    .reduce(0, +)
}

func length(A: Int, P: Int, seq: Int, visited: inout [Int]) -> Int {
  if visited[A] != 0 {
    return visited[A] - 1
  }
  visited[A] = seq
  let nx = next(A: A, P: P)
  return length(A: nx, P: P, seq: seq + 1, visited: &visited)
}

var visited = [Int](repeating: 0, count: 1_000_000)
let input = readLine()!.split(separator: " ").map { Int($0)! }
let A = input[0]
let P = input[1]
print(length(A: A, P: P, seq: 1, visited: &visited))
