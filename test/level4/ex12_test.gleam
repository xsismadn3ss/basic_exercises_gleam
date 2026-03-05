import level4/ex12.{Empty, Node, contains, size, sum}

pub fn ex12_test() {
  // Arbol:
  //     1
  //   /  \
  //  2   3
  // 

  let tree = Node(1, Node(2, Empty, Empty), Node(3, Empty, Empty))

  assert size(tree:) == 3
  assert sum(tree:) == 6
  assert contains(tree:, value: 3) == True
}
