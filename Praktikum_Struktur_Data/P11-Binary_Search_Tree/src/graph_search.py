from collections import deque

# Representasi graf menggunakan dictionary (adjacency list)
graph: dict[str, list[str]] = {
    "A": ["B", "C"],
    "B": ["D", "E"],
    "C": ["F", "G"],
    "D": [],
    "E": [],
    "F": [],
    "G": [],
}


def dfs(graph: dict[str, list[str]], start: str) -> list[str]:
    """Depth-First Search menggunakan stack (LIFO)."""
    visited: list[str] = []
    stack: list[str] = [start]

    while stack:
        node = stack.pop()
        if node not in visited:
            visited.append(node)
            # reversed agar urutan sesuai adjacency list (kiri ke kanan)
            stack.extend(reversed(graph[node]))

    return visited


def bfs(graph: dict[str, list[str]], start: str) -> list[str]:
    """Breadth-First Search menggunakan queue (FIFO)."""
    visited: list[str] = []
    queue: deque[str] = deque([start])

    while queue:
        node = queue.popleft()
        if node not in visited:
            visited.append(node)
            queue.extend(graph[node])

    return visited


if __name__ == "__main__":
    print("=== Graf (Adjacency List) ===")
    for node, neighbors in graph.items():
        print(f"  {node} -> {neighbors}")

    print(f"\nDFS dari A: {dfs(graph, 'A')}")
    print(f"BFS dari A: {bfs(graph, 'A')}")
